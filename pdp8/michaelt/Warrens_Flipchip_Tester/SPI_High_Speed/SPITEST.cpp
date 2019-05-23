//
// SPITEST.cpp : Defines the entry point for the console application.
// this example project use port A of C232HM to access SPI GPIO MCP23S17

//
#include "stdafx.h"
#include <windows.h>
//============================================================================
//  Use of FTDI D2XX library:
//----------------------------------------------------------------------------
//  Include the following 2 lines in your header-file
#pragma comment(lib, "FTD2XX.lib")
#include "FTD2XX.h"
//============================================================================
#include <stdlib.h>
//declare parameters for MCP23S17
#define MemSize 16
const BYTE SPIDATALENGTH = 10;
const BYTE READ = '\xC0';
const BYTE WRITE = '\xA0';
const BYTE WREN = '\x9F';
const BYTE ERAL = '\x97';

const BYTE AA_ECHO_CMD_1 = '\xAA';
const BYTE AB_ECHO_CMD_2 = '\xAB';
const BYTE BAD_COMMAND_RESPONSE = '\xFA';

const BYTE MSB_RISING_EDGE_CLOCK_BYTE_OUT = '\x10';
const BYTE MSB_FALLING_EDGE_CLOCK_BYTE_OUT = '\x11';
const BYTE MSB_RISING_EDGE_CLOCK_BIT_OUT = '\x12';
const BYTE MSB_FALLING_EDGE_CLOCK_BIT_OUT = '\x13';
const BYTE MSB_RISING_EDGE_CLOCK_BYTE_IN = '\x20';
const BYTE MSB_RISING_EDGE_CLOCK_BIT_IN = '\x22';
const BYTE MSB_FALLING_EDGE_CLOCK_BYTE_IN = '\x24';
const BYTE MSB_FALLING_EDGE_CLOCK_BIT_IN = '\x26';

FT_STATUS ftStatus;			//Status defined in D2XX to indicate operation result

BYTE OutputBuffer[512];		//Buffer to hold MPSSE commands and data to be sent to C232HM
BYTE InputBuffer[512];		//Buffer to hold Data bytes to be read from C232HM
DWORD dwClockDivisor = 29;  //Value of clock divisor, SCL Frequency = 60/((1+29)*2) (MHz) = 1Mhz
DWORD dwNumBytesToSend = 0; //Index of output buffer
DWORD dwNumBytesSent = 0;
DWORD dwNumBytesRead = 0;
DWORD dwNumInputBuffer = 0;

BYTE ByteDataRead;
WORD MemAddress = 0x00;		

WORD i = 0;
BYTE DataOutBuffer[MemSize];		
BYTE DataInBuffer[MemSize];

void SPI_CSEnable()
{
	for(int loop=0;loop<5;loop++)
	{
	  OutputBuffer[dwNumBytesToSend++] = '\x80';
	  OutputBuffer[dwNumBytesToSend++] = '\x00';
	  OutputBuffer[dwNumBytesToSend++] = '\x0b';
	}
}

void SPI_CSDisable()
{
	for(int loop=0;loop<5;loop++)
	{
	  OutputBuffer[dwNumBytesToSend++] = '\x80';
	  OutputBuffer[dwNumBytesToSend++] = '\x08';
	  OutputBuffer[dwNumBytesToSend++] = '\x0b';
	}
}

FT_STATUS WriteEECmd(FT_HANDLE ftHandle, BYTE command) 
{
	dwNumBytesSent=0;
    SPI_CSEnable(); //Enable the SPI Chip Select
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 7;
	OutputBuffer[dwNumBytesToSend++] = command;
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = SPIDATALENGTH - (8+1);
	OutputBuffer[dwNumBytesToSend++] = '\xff';
	SPI_CSDisable(); //Disable the SPI Chip Select
	ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent); //Write the OutputBufer to the MCP23S17
	dwNumBytesToSend = 0; //Clear output buffer

	return ftStatus; //Return the status from the D2XX dll call
}

BOOL SPI_Initial(FT_HANDLE ftHandle)
{		
	DWORD dwCount;
	ftStatus = FT_ResetDevice(ftHandle); 	//Reset USB device
	//Purge USB receive buffer first by reading out all old data from C232HM receive buffer
	ftStatus |= FT_GetQueueStatus(ftHandle, &dwNumInputBuffer);	 // Get the number of bytes in the C232HM receive buffer
	if ((ftStatus == FT_OK) && (dwNumInputBuffer > 0))
		ftStatus |= FT_Read(ftHandle, InputBuffer, dwNumInputBuffer, &dwNumBytesRead);  	//Read out the data from C232HM receive buffer
	ftStatus |= FT_SetUSBParameters(ftHandle, 65535, 65535);	//Set USB request transfer size
	ftStatus |= FT_SetChars(ftHandle, false, 0, false, 0);	 //Disable event and error characters
	ftStatus |= FT_SetTimeouts(ftHandle, 3000, 3000);		//Sets the read and write timeouts in milliseconds for the C232HM
	ftStatus |= FT_SetLatencyTimer(ftHandle, 1);		//Set the latency timer
	ftStatus |= FT_SetBitMode(ftHandle, 0x0, 0x00); 		//Reset controller
	ftStatus |= FT_SetBitMode(ftHandle, 0x0, 0x02);	 	//Enable MPSSE mode

	if (ftStatus != FT_OK)
	{
		printf("fail on initialize C232HM device ! \n");
		return false;
	}

	Sleep(50);	// Wait for all the USB stuff to complete and work

	//////////////////////////////////////////////////////////////////
	// Synchronize the MPSSE interface by sending bad command ¡®0xAA¡¯
	//////////////////////////////////////////////////////////////////
	dwNumBytesToSend = 0;
	OutputBuffer[dwNumBytesToSend++] = '\xAA';		//Add BAD command ¡®0xAA¡¯
	ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);	// Send off the BAD commands
	dwNumBytesToSend = 0;			//Clear output buffer

	do{
		ftStatus = FT_GetQueueStatus(ftHandle, &dwNumInputBuffer);	 // Get the number of bytes in the device input buffer
	}while ((dwNumInputBuffer == 0) && (ftStatus == FT_OK));   	//or Timeout
	
	bool bCommandEchod = false;
	ftStatus = FT_Read(ftHandle, InputBuffer, dwNumInputBuffer, &dwNumBytesRead);  //Read out the data from input buffer

	for (dwCount = 0; dwCount < (dwNumBytesRead - 1); dwCount++)	//Check if Bad command and echo command received
	{
		if ((InputBuffer[dwCount] == BYTE('\xFA')) && (InputBuffer[dwCount+1] == BYTE('\xAA')))
		{
			bCommandEchod = true;
			break;
		}
	}
	if (bCommandEchod == false) 
	{	
		printf("fail to synchronize MPSSE with command '0xAA' \n");
		return false; /*Error, can¡¯t receive echo command , fail to synchronize MPSSE interface;*/ 
	}
	
	//////////////////////////////////////////////////////////////////
	// Synchronize the MPSSE interface by sending bad command ¡®0xAB¡¯
	//////////////////////////////////////////////////////////////////
	//dwNumBytesToSend = 0;			//Clear output buffer
	OutputBuffer[dwNumBytesToSend++] = '\xAB';	//Send BAD command ¡®0xAB¡¯
	ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);	// Send off the BAD commands
	dwNumBytesToSend = 0;			//Clear output buffer
	do{
		ftStatus = FT_GetQueueStatus(ftHandle, &dwNumInputBuffer);	//Get the number of bytes in the device input buffer
	}while ((dwNumInputBuffer == 0) && (ftStatus == FT_OK));   //or Timeout
	bCommandEchod = false;
	ftStatus = FT_Read(ftHandle, InputBuffer, dwNumInputBuffer, &dwNumBytesRead);  //Read out the data from input buffer
	for (dwCount = 0;dwCount < (dwNumBytesRead - 1); dwCount++)	//Check if Bad command and echo command received
	{
		if ((InputBuffer[dwCount] == BYTE('\xFA')) && (InputBuffer[dwCount+1] == BYTE( '\xAB')))
		{
			bCommandEchod = true;
			break;
		}
	}
	if (bCommandEchod == false)  
	{	
		printf("fail to synchronize MPSSE with command '0xAB' \n");
		return false; 
		/*Error, can't receive echo command , fail to synchronize MPSSE interface;*/ 
	}
    ////////////////////////////////////////////////////////////////////
    //Configure the MPSSE for SPI communication with EEPROM
    //////////////////////////////////////////////////////////////////
    OutputBuffer[dwNumBytesToSend++] = '\x8A'; 	//Ensure disable clock divide by 5 for 60Mhz master clock
    OutputBuffer[dwNumBytesToSend++] = '\x97';	 //Ensure turn off adaptive clocking
    OutputBuffer[dwNumBytesToSend++] = '\x8D'; 	//disable 3 phase data clock
    ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);	// Send off the commands
    dwNumBytesToSend = 0;			//Clear output buffer
    OutputBuffer[dwNumBytesToSend++] = '\x80'; 	//Command to set directions of lower 8 pins and force value on bits set as output 
    OutputBuffer[dwNumBytesToSend++] = '\x00'; 	//Set SDA, SCL high, WP disabled by SK, DO at bit ¡®1¡¯, GPIOL0 at bit ¡®0¡¯
    OutputBuffer[dwNumBytesToSend++] = '\x0b';	//Set SK,DO,GPIOL0 pins as output with bit ¡¯1¡¯, other pins as input with bit ¡®0¡¯
    // The SK clock frequency can be worked out by below algorithm with divide by 5 set as off
    // SK frequency  = 60MHz /((1 +  [(1 +0xValueH*256) OR 0xValueL])*2)
    OutputBuffer[dwNumBytesToSend++] = '\x86'; 			//Command to set clock divisor
    OutputBuffer[dwNumBytesToSend++] = BYTE(dwClockDivisor & '\xFF');	//Set 0xValueL of clock divisor
    OutputBuffer[dwNumBytesToSend++] = BYTE(dwClockDivisor >> 8);	//Set 0xValueH of clock divisor
    ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);	// Send off the commands
    dwNumBytesToSend = 0;			//Clear output buffer
    Sleep(20);		//Delay for a while
    
    //Turn off loop back in case
    OutputBuffer[dwNumBytesToSend++] = '\x85';		//Command to turn off loop back of TDI/TDO connection
    ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);	// Send off the commands
    dwNumBytesToSend = 0;			//Clear output buffer
    Sleep(30);		//Delay for a while
	printf("SPI initial successful\n");
	return true;
}

BOOL SPI_WriteByte2RandomAddr(FT_HANDLE ftHandle, WORD address,BYTE bdata)
{ 
	dwNumBytesSent=0;
    SPI_CSEnable();
	//send WRITE command
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 2;
	OutputBuffer[dwNumBytesToSend++] = WRITE;
	//send address
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 6;
	OutputBuffer[dwNumBytesToSend++] = (BYTE)(address << 1);
	//send data
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 7;
	OutputBuffer[dwNumBytesToSend++] = bdata;
	SPI_CSDisable();
	ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);		
	dwNumBytesToSend = 0;			//Clear output buffer

	return ftStatus;
}

BOOL SPI_ReadByteRandomAddr(FT_HANDLE ftHandle, WORD address, BYTE* bdata)
{   
	dwNumBytesSent=0;
    SPI_CSEnable();
	//send WRITE command
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 2;
	OutputBuffer[dwNumBytesToSend++] = READ;
	//send address
	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BIT_OUT;
	OutputBuffer[dwNumBytesToSend++] = 6;
	OutputBuffer[dwNumBytesToSend++] = (BYTE)(address << 1);
	//read data
  	OutputBuffer[dwNumBytesToSend++] = MSB_FALLING_EDGE_CLOCK_BYTE_IN; 	
  	OutputBuffer[dwNumBytesToSend++] = '\x00';
  	OutputBuffer[dwNumBytesToSend++] = '\x00';	//Data length of 0x0000 means 1 byte data to clock in
	SPI_CSDisable();
	ftStatus = FT_Write(ftHandle, OutputBuffer, dwNumBytesToSend, &dwNumBytesSent);		
	dwNumBytesToSend = 0;			//Clear output buffer
    ftStatus = FT_Read(ftHandle, InputBuffer, 1, &dwNumBytesRead);//Read one byte from device receive buffer
	*bdata = InputBuffer[0];
	return ftStatus;
} 

int _tmain(int argc, _TCHAR* argv[])
{
  FT_HANDLE ftdiHandle;
  DWORD numDevs;
  FT_DEVICE_LIST_INFO_NODE *devInfo;

  ftStatus = FT_CreateDeviceInfoList(&numDevs);
  if (ftStatus == FT_OK)
    printf("Number of devices is %d\n",numDevs);
  else 
	  return 1;
  if (numDevs > 0) {
  // allocate storage for list based on numDevs
    devInfo = (FT_DEVICE_LIST_INFO_NODE*)malloc(sizeof(FT_DEVICE_LIST_INFO_NODE)*numDevs); 
  // get the device information list
    ftStatus = FT_GetDeviceInfoList(devInfo,&numDevs); 
    if (ftStatus == FT_OK) {
      for (i = 0; i < numDevs; i++) {
       printf("Dev %d:\n",i); 
       printf("  Flags=0x%x\n",devInfo[i].Flags); 
       printf("  Type=0x%x\n",devInfo[i].Type); 
       printf("  ID=0x%x\n",devInfo[i].ID); 
       printf("  LocId=0x%x\n",devInfo[i].LocId); 
       printf("  SerialNumber=%s\n",devInfo[i].SerialNumber); 
       printf("  Description=%s\n",devInfo[i].Description); 
       printf("  ftHandle=0x%x\n",devInfo[i].ftHandle); 
     }
    }
  }
  else
	  return 1;

  ftStatus = FT_OpenEx("C232HM-DDHSL-0",FT_OPEN_BY_DESCRIPTION,&ftdiHandle);
  if (ftStatus != FT_OK)
  {
  	printf("Can't open C232HM device! \n");
  	return 1;
  }
  else  // Port opened successfully
  	printf("Successfully opened C232HM device! \n");
  
  if(SPI_Initial(ftdiHandle) == TRUE)
  {
	byte ReadByte = 0;
	//initial output buffer
	for(i=0;i<MemSize;i++)
	   DataOutBuffer[i] = (byte)(i+1);
  
  	//Purge USB received buffer first before read operation
  	ftStatus = FT_GetQueueStatus(ftdiHandle, &dwNumInputBuffer);	 // Get the number of bytes in the device receive buffer
  	if ((ftStatus == FT_OK) && (dwNumInputBuffer > 0))
  			FT_Read(ftdiHandle, InputBuffer, dwNumInputBuffer, &dwNumBytesRead);  //Read out all the data from receive buffer

	WriteEECmd(ftdiHandle, WREN);
	WriteEECmd(ftdiHandle, ERAL);

	Sleep(20);

	for(i=0;i<MemSize;i++)
	{
		SPI_WriteByte2RandomAddr(ftdiHandle, i,DataOutBuffer[i]);
		Sleep(1);
		printf("Write data %d to address %d\n",DataOutBuffer[i],i);
	}

	Sleep(20);

	for(i=0;i<MemSize;i++)
	{
		SPI_ReadByteRandomAddr(ftdiHandle, i,&DataInBuffer[i]);
		printf("Read data from address %d = %d\n",i,DataInBuffer[i]);
	}

  	getchar(); //Wait for the user to hit a key and then close the window
  }

  FT_Close(ftdiHandle);
  return 0;
}

