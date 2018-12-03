/*!
 * \file sample-dynamic.c
 *
 * \author FTDI
 * \date 20110512
 *
 * Copyright © 2011 Future Technology Devices International Limited
 * Company Confidential
 *
 * Project: libMPSSE
 * Module: SPI Sample Application - Interfacing 94LC56B SPI EEPROM
 *
 * Rivision History:
 * 0.1 - 20110512 - Initial version
 * 0.2 - 20110801 - Changed LatencyTimer to 255
 * 				  Attempt to open channel only if available
 *				  Added & modified macros
 */

#include<stdio.h>
#include<stdlib.h>
#ifdef _WIN32
#include<windows.h>
#endif

#ifdef __linux
#include<dlfcn.h>
#endif
#include "libMPSSE_spi.h"
#include "ftd2xx.h"

#ifdef _WIN32
	#define GET_FUN_POINTER	GetProcAddress
	#define CHECK_ERROR(exp) {if(exp==NULL){printf("%s:%d:%s():  NULL expression encountered \n",__FILE__, __LINE__, __FUNCTION__);exit(1);}else{;}};
#endif

#ifdef __linux
	#define GET_FUN_POINTER	dlsym
	#define CHECK_ERROR(exp) {if(dlerror() != NULL){printf("line %d: ERROR dlsym\n",__LINE__);}}
#endif
#define APP_CHECK_STATUS(exp) {if(exp!=FT_OK){printf("%s:%d:%s(): status(0x%x) != FT_OK\n",__FILE__, __LINE__, __FUNCTION__,exp);exit(1);}else{;}};
#define CHECK_NULL(exp){if(exp==NULL){printf("%s:%d:%s():  NULL expression encountered \n",__FILE__, __LINE__, __FUNCTION__);exit(1);}else{;}};

#define SPI_DEVICE_BUFFER_SIZE		256
#define SPI_WRITE_COMPLETION_RETRY		10
#define START_ADDRESS_EEPROM 	0x00
#define END_ADDRESS_EEPROM		0x00
#define RETRY_COUNT_EEPROM		10
#define CHANNEL_TO_OPEN			0	/*0 for first available channel, 1 for next... */
#define SPI_SLAVE_0				0
#define SPI_SLAVE_1				1
#define SPI_SLAVE_2				2

/* Options-Bit0: If this bit is 1 then it means that the transfer size provided is in bytes */
#define	SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES			0x00000001
/* Options-Bit0: If this bit is 1 then it means that the transfer size provided is in bits */
#define	SPI_TRANSFER_OPTIONS_SIZE_IN_BITS			0x00000001
/* Options-Bit1: if BIT1 is 1 then CHIP_SELECT line will be enables at start of transfer */
#define	SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE		0x00000002
/* Options-Bit2: if BIT2 is 1 then CHIP_SELECT line will be disabled at end of transfer */
#define SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE		0x00000004  // was 0004

typedef FT_STATUS (*pfunc_SPI_GetNumChannels)(uint32 *numChannels);
pfunc_SPI_GetNumChannels p_SPI_GetNumChannels;
typedef FT_STATUS (*pfunc_SPI_GetChannelInfo)(uint32 index, FT_DEVICE_LIST_INFO_NODE *chanInfo);
pfunc_SPI_GetChannelInfo p_SPI_GetChannelInfo;
typedef FT_STATUS (*pfunc_SPI_OpenChannel)(uint32 index, FT_HANDLE *handle);
pfunc_SPI_OpenChannel p_SPI_OpenChannel;
typedef FT_STATUS (*pfunc_SPI_InitChannel)(FT_HANDLE handle, ChannelConfig *config);
pfunc_SPI_InitChannel p_SPI_InitChannel;
typedef FT_STATUS (*pfunc_SPI_CloseChannel)(FT_HANDLE handle);
pfunc_SPI_CloseChannel p_SPI_CloseChannel;
typedef FT_STATUS (*pfunc_SPI_Read)(FT_HANDLE handle, uint8 *buffer, uint32 sizeToTransfer, uint32 *sizeTransfered, uint32 options);
pfunc_SPI_Read p_SPI_Read;
typedef FT_STATUS (*pfunc_SPI_Write)(FT_HANDLE handle, uint8 *buffer, uint32 sizeToTransfer, uint32 *sizeTransfered, uint32 options);
pfunc_SPI_Write p_SPI_Write;
typedef FT_STATUS (*pfunc_SPI_IsBusy)(FT_HANDLE handle, bool *state);
pfunc_SPI_IsBusy p_SPI_IsBusy;


uint32 channels;
FT_HANDLE ftHandle;
ChannelConfig channelConf;
uint8 buffer[SPI_DEVICE_BUFFER_SIZE];

FT_STATUS read_byte(uint8 slaveAddress, uint8 address, uint16 *data)
{
	uint32 sizeToTransfer = 0;
	uint32 sizeTransfered;
	bool writeComplete=0;
	uint32 retry=0;
	bool state;
	FT_STATUS status;

	/* CS_High + Write command + Address */
	sizeToTransfer=1;
	sizeTransfered=0;
	buffer[0] = 0xC0;/* Write command (3bits)*/
	buffer[0] = buffer[0] | ( ( address >> 3) & 0x0F );/* plus 5 most significant address bits */
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	APP_CHECK_STATUS(status);

	/*Write partial address bits */
	sizeToTransfer=4;
	sizeTransfered=0;
	buffer[0] = ( address & 0x07 ) << 5; /* least significant 3 address bits */
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	APP_CHECK_STATUS(status);

	/*Read 2 bytes*/
	sizeToTransfer=2;
	sizeTransfered=0;
	status = p_SPI_Read(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);

	*data = (uint16)(buffer[1]<<8);
	*data = (*data & 0xFF00) | (0x00FF & (uint16)buffer[0]);

	return status;
}



FT_STATUS write_byte(uint8 slaveAddress, uint8 address, uint16 data)
{
	uint32 sizeToTransfer = 0;
	uint32 sizeTransfered=0;
	bool writeComplete=0;
	uint32 retry=0;
	bool state;
	FT_STATUS status;

	/*Write command EWEN (with CS_High -> CS_Low) */
	sizeToTransfer=24;  // was 11
	sizeTransfered=0;
	buffer[0]=0x40;
	buffer[1]=0x0A;
	buffer[2]=0xAA;
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);

	/* CS_High + Write command + Address */
	sizeToTransfer=1;
	sizeTransfered=0;
	buffer[0] = 0xA0;/* Write command (3bits) 
	buffer[0] = buffer[0] | ( ( address >> 3) & 0x0F ); /* plus 5 most significant address bits */
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	APP_CHECK_STATUS(status);

	/*Write 3 least sig address bits */ 
	sizeToTransfer=3;
	sizeTransfered=0;
	buffer[0] = ( address & 0x07 ) << 5;   /*least significant 3 address bits */
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS);
	APP_CHECK_STATUS(status);

	/* Write 2 byte data + CS_Low */
	sizeToTransfer=2;
	sizeTransfered=0;
	buffer[0] = (uint8)(data & 0xFF);
	buffer[1] = (uint8)((data & 0xFF00)>>8);
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);

	/* Wait until D0 is high */
#if 1
	/* Strobe Chip Select */
	sizeToTransfer=0;
	sizeTransfered=0;
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE);
	APP_CHECK_STATUS(status);
#ifndef __linux__
	Sleep(10);
#endif
	sizeToTransfer=0;
	sizeTransfered=0;
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);
#else
	retry=0;
	state=FALSE;
	p_SPI_IsBusy(ftHandle,&state);
	while((FALSE==state) && (retry<SPI_WRITE_COMPLETION_RETRY))
	{
		printf("SPI device is busy(%u)\n",(unsigned)retry);
		p_SPI_IsBusy(ftHandle,&state);
		retry++;
	}
#endif
	/* Write command EWEN(with CS_High -> CS_Low) */
	sizeToTransfer=11;
	sizeTransfered=0;
	buffer[0]=0x8F;  /*SPI_EWEN -> binary 10011xxxxxx (11bits) */
	buffer[1]=0xFF;
	status = p_SPI_Write(ftHandle, buffer, sizeToTransfer, &sizeTransfered, 
		SPI_TRANSFER_OPTIONS_SIZE_IN_BITS|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE|
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
	APP_CHECK_STATUS(status);
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
#ifdef __linux
	void *h_libMPSSE;
#endif
	FT_STATUS status;
	FT_DEVICE_LIST_INFO_NODE devList;
	uint8 address=0;
	uint16 data;
	int i,j;
	uint32 sizeToTransfer, sizeTransfered;

	channelConf.ClockRate = 5000;
	channelConf.LatencyTimer= 255;
	channelConf.configOptions = SPI_CONFIG_OPTION_MODE0| SPI_CONFIG_OPTION_CS_DBUS3| ;
	channelConf.Pin = 0x00000000; /* FinalVal-FinalDir-InitVal-InitDir (for dir: 0=in, 1=out) */ 

	/* load library */
#ifdef _WIN32
#ifdef _MSC_VER
	h_libMPSSE = LoadLibrary(L"libMPSSE.dll");
#else
	h_libMPSSE = LoadLibrary("libMPSSE.dll");
#endif

	CHECK_NULL(h_libMPSSE);
#endif

#if __linux
	h_libMPSSE = dlopen("libMPSSE.so",RTLD_LAZY);
	if(!h_libMPSSE)
	{
		printf("Failed loading libMPSSE.so\n");
	}
#endif
	/* init function pointers */
	p_SPI_GetNumChannels = (pfunc_SPI_GetNumChannels)GET_FUN_POINTER(h_libMPSSE, "SPI_GetNumChannels");
	CHECK_NULL (p_SPI_GetNumChannels);
	p_SPI_GetChannelInfo = (pfunc_SPI_GetChannelInfo)GET_FUN_POINTER(h_libMPSSE, "SPI_GetChannelInfo");
	CHECK_NULL(p_SPI_GetChannelInfo);
	p_SPI_OpenChannel = (pfunc_SPI_OpenChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_OpenChannel");
	CHECK_NULL(p_SPI_OpenChannel);	
	p_SPI_InitChannel = (pfunc_SPI_InitChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_InitChannel");
	CHECK_NULL(p_SPI_InitChannel);
	p_SPI_Read = (pfunc_SPI_Read)GET_FUN_POINTER(h_libMPSSE, "SPI_Read");
	CHECK_NULL(p_SPI_Read);
	p_SPI_Write = (pfunc_SPI_Write)GET_FUN_POINTER(h_libMPSSE, "SPI_Write");
	CHECK_NULL(p_SPI_Write);
	p_SPI_CloseChannel = (pfunc_SPI_CloseChannel)GET_FUN_POINTER(h_libMPSSE, "SPI_CloseChannel");
	CHECK_NULL(p_SPI_CloseChannel);
	p_SPI_IsBusy = (pfunc_SPI_IsBusy)GET_FUN_POINTER(h_libMPSSE, "SPI_IsBusy");
	CHECK_NULL(p_SPI_IsBusy);
	
	status = p_SPI_GetNumChannels(&channels);
	APP_CHECK_STATUS(status);
	printf("Number of available SPI channels = %d\n",channels);
	if(channels>0)
	{
		for(i=0;i<channels;i++)
		{
			status = p_SPI_GetChannelInfo(i,&devList);
			APP_CHECK_STATUS(status);
			printf("Information on channel number %d:\n",i);
			/*print the dev info*/
			printf("		Flags=0x%x\n",devList.Flags); 
			printf("		Type=0x%x\n",devList.Type); 
			printf("		ID=0x%x\n",devList.ID); 
			printf("		LocId=0x%x\n",devList.LocId); 
			printf("		SerialNumber=%s\n",devList.SerialNumber); 
			printf("		Description=%s\n",devList.Description); 
			printf("		ftHandle=0x%x\n",devList.ftHandle);/*always 0 unless open*/
		}
		
		status = p_SPI_OpenChannel(CHANNEL_TO_OPEN,&ftHandle);/*Open the first available channel*/
		APP_CHECK_STATUS(status);
		printf("\nhandle=0x%x status=0x%x\n",ftHandle,status);
		status = p_SPI_InitChannel(ftHandle,&channelConf);
		
		 for(address=START_ADDRESS_EEPROM;address<END_ADDRESS_EEPROM;address++)
		{
			printf("Writing byte at address = %d   \n",address);
			write_byte(SPI_SLAVE_0, address,(uint16)address+1);
		}

		for(address=START_ADDRESS_EEPROM;address<END_ADDRESS_EEPROM;address++)
		{
			//read_byte(SPI_SLAVE_0, address,&data);
			printf("Read address=0x%x data=0x%x\n",address,data);
		}
		
		status = p_SPI_CloseChannel(ftHandle);
	}
	return 0;
}
