/*
 * \file sample-dynamic.c
 *
 * \author FTDI
 * \date 20110922
 *
 * Copyright © 2011 Future Technology Devices International Limited
 * Company Confidential
 *
 * Project: libMPSSE
 * Module: SPI Sample Application - Interfacing CM232H Cable to MCP23S08 8 Bit I/O Expander
 * Refer to Applications Note AN_188 for operational details
 * FTDI-USA Apps Project
 * Revision History:
 * 1.0  Initial version  *
 *
 */

#include<stdio.h>
#include<stdlib.h>
#ifdef _WIN32
#include<windows.h>
#endif

#include "libMPSSE_spi.h"
#include "ftd2xx.h"

#ifdef _WIN32
#define GET_FUN_POINTER	GetProcAddress
#endif

#define SPI_DEVICE_BUFFER_SIZE		256
#define SPI_WRITE_COMPLETION_RETRY	10
#define CHANNEL_TO_OPEN			0	/*0 for first available channel, 1 for next... */
#define SPI_SLAVE_0				0
#define SPI_SLAVE_1				1
#define SPI_SLAVE_2				2

typedef FT_STATUS(*pfunc_SPI_GetNumChannels)(uint32 *numChannels);
pfunc_SPI_GetNumChannels p_SPI_GetNumChannels;
typedef FT_STATUS(*pfunc_SPI_GetChannelInfo)(uint32 index, FT_DEVICE_LIST_INFO_NODE *chanInfo);
pfunc_SPI_GetChannelInfo p_SPI_GetChannelInfo;
typedef FT_STATUS(*pfunc_SPI_OpenChannel)(uint32 index, FT_HANDLE *handle);
pfunc_SPI_OpenChannel p_SPI_OpenChannel;
typedef FT_STATUS(*pfunc_SPI_InitChannel)(FT_HANDLE handle, ChannelConfig *config);
pfunc_SPI_InitChannel p_SPI_InitChannel;
typedef FT_STATUS(*pfunc_SPI_CloseChannel)(FT_HANDLE handle);
pfunc_SPI_CloseChannel p_SPI_CloseChannel;
typedef FT_STATUS(*pfunc_SPI_Read)(FT_HANDLE handle, uint8 *buffer, uint32 sizeToTransfer, uint32 *sizeTransfered, uint32 options);
pfunc_SPI_Read p_SPI_Read;
typedef FT_STATUS(*pfunc_SPI_Write)(FT_HANDLE handle, uint8 *buffer, uint32 sizeToTransfer, uint32 *sizeTransfered, uint32 options);
pfunc_SPI_Write p_SPI_Write;
typedef FT_STATUS(*pfunc_SPI_IsBusy)(FT_HANDLE handle, bool *state);
pfunc_SPI_IsBusy p_SPI_IsBusy;

uint32 channels;
uint8  LEDS = 0x00;
FT_HANDLE ftHandle;
ChannelConfig channelConf;
uint8 buffer[SPI_DEVICE_BUFFER_SIZE];

FT_STATUS write_IODIR(uint8 address)
{
	uint32 sizeToTransfer = 0;
	uint32 sizeTransfered = 0;
	FT_STATUS status;

	/*Write command to configure MCP23S17's IODIR register as all outputs*/
	sizeToTransfer = 32;  //4 Bytes Opcodes and Data
	sizeTransfered = 0;
	buffer[0] = 0x40 | (address << 1); // Opcode to select device 
	buffer[1] = 0x00; // Opcode for IODIR register
	buffer[2] = 0x00; // Data Packet - Make GPIO pins outputs
	buffer[3] = 0x00; // Data Packet - Make GPIO pins outputs
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);

	return status;
}

FT_STATUS write_byte(uint8 address, uint8 register_contents)
{
	uint32 sizeToTransfer = 0;
	uint32 sizeTransfered = 0;
	bool writeComplete = 0;
	uint32 retry = 0;
	FT_STATUS status;

	/* Write Data to MCP23S17's OLAT Register */
	sizeToTransfer = 32;  // 3 Bytes Opcodes + Data
	sizeTransfered = 0;
	buffer[0] = 0x40 | (address << 1);  //  Opcode to select device
	buffer[1] = 0x0A;  //  Opcode for OLAT Register
	buffer[2] = register_contents;  //  Data to write to OLAT
	buffer[3] = register_contents;  //  Data to write to OLAT
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered,
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS | SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE | SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);

	return status;
}


int main()
{
#ifdef _WIN32
#ifdef _MSC_VER
	HMODULE h_libMPSSE;
#else
	HANDLE h_libMPSSE;
#endif
#endif

	FT_STATUS status;
	//FT_DEVICE_LIST_INFO_NODE devList;
	uint8 address = 3; //Address of MCP23S17
	uint8 counter = 0; //Counter value to wiggle output pins
	channelConf.ClockRate = 100000; //100 KHz
	channelConf.LatencyTimer = 255;
	channelConf.configOptions = SPI_CONFIG_OPTION_MODE0 | SPI_CONFIG_OPTION_CS_DBUS3 | SPI_CONFIG_OPTION_CS_ACTIVELOW;
	channelConf.Pin = 0x00000000;/* FinalVal-FinalDir-InitVal-InitDir (for dir: 0=in, 1=out) */

// Load libMPSSE
#ifdef _WIN32
#ifdef _MSC_VER
	h_libMPSSE = LoadLibrary(L"libMPSSE.dll");

#endif
#endif

	// init function pointers
	p_SPI_GetNumChannels = (pfunc_SPI_GetNumChannels)GET_FUN_POINTER(h_libMPSSE, "SPI_GetNumChannels");
	p_SPI_GetChannelInfo = (pfunc_SPI_GetChannelInfo)GET_FUN_POINTER(h_libMPSSE, "SPI_GetChannelInfo");
	p_SPI_OpenChannel = (pfunc_SPI_OpenChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_OpenChannel");
	p_SPI_InitChannel = (pfunc_SPI_InitChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_InitChannel");
	p_SPI_Read = (pfunc_SPI_Read)GET_FUN_POINTER(h_libMPSSE, "SPI_Read");
	p_SPI_Write = (pfunc_SPI_Write)GET_FUN_POINTER(h_libMPSSE, "SPI_Write");
	p_SPI_CloseChannel = (pfunc_SPI_CloseChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_CloseChannel");

	printf("GetNumChannels\n");
	status = p_SPI_GetNumChannels(&channels);
	printf("Number of available SPI channels = %d\n", channels);

	printf("OpenChannel\n");
	status = p_SPI_OpenChannel(CHANNEL_TO_OPEN, &ftHandle); // Open the first available channel

	printf("InitChannel\n");
	status = p_SPI_InitChannel(ftHandle, &channelConf);

	printf("write_IODIR\n");
	status = write_IODIR(address); //Configure the IODIR register

	printf("Entering write_byte loop\n");

	do {

	// Call Write Byte Function to activate LEDs on GPIO pins
	write_byte(address, counter);
	counter++; //Bump the counter value
	}
	while (true);

	printf("CloseChannel");
	status = p_SPI_CloseChannel(ftHandle);
}

