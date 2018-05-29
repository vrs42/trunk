/*      -*- c# -*-
 *
 * Copyright (C) 2018, The Rhode Island Computer Museum
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * Author(s):
 *      Michael Thompson <mike@ricomputermuseum.org>
 */

//**************************************************************************
//
// This class contains everything for the FlipChip tester except for the GUI
// and the code supplied by FTDI for the USB/SPI cable.
//
//**************************************************************************

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using FTD2XX_NET;
using libMPSSEWrapper;
using libMPSSEWrapper.Types;
using libMPSSEWrapper.Exceptions;
using Warrens_Flipchip_Tester.Exceptions;
using Warrens_Flipchip_Tester.Types;

namespace Warrens_Flipchip_Tester
{
    class FlipChipTester : IDisposable
    {
        private IntPtr unmanagedResource;
        private bool disposed = false;

        //**************************************************************************
        //
        // For the FTDI FTD2XX_NET DLL
        //
        //**************************************************************************

        private UInt32 FtdiDeviceCount = 0; //Number of FTDI devices found
        private FTDI.FT_STATUS FtdiStatus = FTDI.FT_STATUS.FT_OK; //The status of the last FTDI command
        private FTDI.FT_DEVICE_INFO_NODE[] FtdiDeviceInfoNode = new FTDI.FT_DEVICE_INFO_NODE[10]; //Get read for up to 10 USB cables
        private FTDI FtdiUSB0 = new FTDI(); // Create new instance of the FTDI device class
        private FTDI.FT232R_EEPROM_STRUCTURE FtdiREepromStructure = new FTDI.FT232R_EEPROM_STRUCTURE();
        private FTDI.FT232H_EEPROM_STRUCTURE FtdiHEepromStructure = new FTDI.FT232H_EEPROM_STRUCTURE();

        //**************************************************************************
        //
        // For the libMPSSEWrapper DLL
        //
        //**************************************************************************

        private const int LatencyTimer = 2; //Small value to make USB go faster
        private UInt32 MpsseChannelCount = 0;
        private int MpsseChannel = 0;
        private FtResult MpsseStatus = FtResult.Ok; //The status of the last Wrapper call command
        private FtDeviceInfo MpsseDeviceInfo;
        private IntPtr SpiHandle;

        //**************************************************************************
        //
        // For the FlipChip Tester
        //
        //**************************************************************************

        private bool StopTestOnFault = true; //The test sequence will stop if a fault is found
        private bool ContinuouslyLoop = false; //Stop when we run out of test vectors
        private int SpiBusSpeed = 1000000; //Set the default Bus Speed to 1MHz
        private const int NumberOfPinDrivers = 80;
        private const int IC1 = 1; //SPI Addresses for the chips
        private const int IC2 = 2;
        private const int IC3 = 3;
        private const int IC4 = 4;
        private const int IC5 = 5;
        private const int ICMax = 6; //The SPI address used to terminate loops
        private int NumberOfPins = 0; //Number of Pins in the Pin Table
        private int NumberOfTestVectors = 0; //The number of test vector lines

        /// <summary>
        /// The FlipChip Pin Mapping Structure used to find the SPI IC address
        /// and the I/O pin mask from a pin name
        /// </summary>
        private struct PinMappingStruct // 80 pin drivers
        {
            public UInt16 SpiAddress { get; }
            public UInt16 Mask { get; }
            public String PinName { get; }
            public PinMappingStruct(UInt16 o, UInt16 m, String p)
            {
                SpiAddress = o;
                Mask = m;
                PinName = p;
            }
        }

        //IC Number -1, Pin mask
        private readonly PinMappingStruct[] PinMappingTable = new PinMappingStruct[NumberOfPinDrivers] {
            new PinMappingStruct( 1, (1 << 15), "AA1" ),
            new PinMappingStruct( 1, (1 << 14), "AB1" ),
            new PinMappingStruct( 1, (1 << 13), "AC1" ),
            new PinMappingStruct( 1, (1 << 12), "AD1" ),
            new PinMappingStruct( 1, (1 << 11), "AE1" ),
            new PinMappingStruct( 1, (1 << 10), "AF1" ),
            new PinMappingStruct( 1, (1 << 9),  "AH1" ),
            new PinMappingStruct( 1, (1 << 8),  "AJ1" ),
            new PinMappingStruct( 2, (1 << 15), "AK1" ),
            new PinMappingStruct( 2, (1 << 14), "AL1" ),
            new PinMappingStruct( 2, (1 << 13), "AM1" ),
            new PinMappingStruct( 2, (1 << 12), "AN1" ),
            new PinMappingStruct( 2, (1 << 11), "AP1" ),
            new PinMappingStruct( 2, (1 << 10), "AR1" ),
            new PinMappingStruct( 2, (1 << 9),  "AS1" ),
            new PinMappingStruct( 2, (1 << 8),  "AT1" ), //GND
            new PinMappingStruct( 3, (1 << 15), "AU1" ),
            new PinMappingStruct( 3, (1 << 14), "AV1" ),
            new PinMappingStruct( 1, (1 << 7),  "AA2" ), //Vpp
	        new PinMappingStruct( 1, (1 << 6),  "AB2" ),
            new PinMappingStruct( 1, (1 << 5),  "AC2" ), //GND
	        new PinMappingStruct( 1, (1 << 4),  "AD2" ),
            new PinMappingStruct( 1, (1 << 3),  "AE2" ),
            new PinMappingStruct( 1, (1 << 2),  "AF2" ),
            new PinMappingStruct( 1, (1 << 1),  "AH2" ),
            new PinMappingStruct( 1, (1 << 0),  "AJ2" ),
            new PinMappingStruct( 2, (1 << 0),  "AK2" ),
            new PinMappingStruct( 2, (1 << 1),  "AL2" ),
            new PinMappingStruct( 2, (1 << 2),  "AM2" ),
            new PinMappingStruct( 2, (1 << 3),  "AN2" ),
            new PinMappingStruct( 2, (1 << 4),  "AP2" ),
            new PinMappingStruct( 2, (1 << 5),  "AR2" ),
            new PinMappingStruct( 2, (1 << 6),  "AS2" ),
            new PinMappingStruct( 2, (1 << 7),  "AT2" ),
            new PinMappingStruct( 3, (1 << 0),  "AU2" ),
            new PinMappingStruct( 3, (1 << 1),  "AV2" ),
            new PinMappingStruct( 3, (1 << 13), "BA1" ),
            new PinMappingStruct( 3, (1 << 12), "BB1" ),
            new PinMappingStruct( 3, (1 << 11), "BC1" ), //GND
	        new PinMappingStruct( 3, (1 << 10), "BD1" ),
            new PinMappingStruct( 3, (1 << 9),  "BE1" ),
            new PinMappingStruct( 3, (1 << 8),  "BF1" ),
            new PinMappingStruct( 4, (1 << 15), "BH1" ),
            new PinMappingStruct( 4, (1 << 14), "BJ1" ),
            new PinMappingStruct( 4, (1 << 13), "BK1" ),
            new PinMappingStruct( 4, (1 << 12), "BL1" ),
            new PinMappingStruct( 4, (1 << 11), "BM1" ),
            new PinMappingStruct( 4, (1 << 10), "BN1" ),
            new PinMappingStruct( 4, (1 << 9),  "BP1" ),
            new PinMappingStruct( 4, (1 << 8),  "BR1" ),
            new PinMappingStruct( 5, (1 << 15), "BS1" ),
            new PinMappingStruct( 5, (1 << 14), "BT1" ), //GND
	        new PinMappingStruct( 5, (1 << 13), "BU1" ),
            new PinMappingStruct( 5, (1 << 12), "BV1" ),
            new PinMappingStruct( 3, (1 << 2),  "BA2" ), //Floating
	        new PinMappingStruct( 3, (1 << 3),  "BB2" ),
            new PinMappingStruct( 3, (1 << 4),  "BC2" ), //GND
	        new PinMappingStruct( 3, (1 << 5),  "BD2" ),
            new PinMappingStruct( 3, (1 << 6),  "BE2" ),
            new PinMappingStruct( 3, (1 << 7),  "BF2" ),
            new PinMappingStruct( 4, (1 << 0),  "BH2" ),
            new PinMappingStruct( 4, (1 << 1),  "BJ2" ),
            new PinMappingStruct( 4, (1 << 2),  "BK2" ),
            new PinMappingStruct( 4, (1 << 3),  "BL2" ),
            new PinMappingStruct( 4, (1 << 4),  "BM2" ),
            new PinMappingStruct( 4, (1 << 5),  "BN2" ),
            new PinMappingStruct( 4, (1 << 6),  "BP2" ),
            new PinMappingStruct( 4, (1 << 7),  "BR2" ),
            new PinMappingStruct( 5, (1 << 0),  "BS2" ),
            new PinMappingStruct( 5, (1 << 1),  "BT2" ),
            new PinMappingStruct( 5, (1 << 2),  "BU2" ),
            new PinMappingStruct( 5, (1 << 3),  "BV2" ),
            new PinMappingStruct( 5, (1 << 5),  "PR1" ),
            new PinMappingStruct( 5, (1 << 5),  "PR2" ),
            new PinMappingStruct( 5, (1 << 6),  "PR3" ),
            new PinMappingStruct( 5, (1 << 7),  "PR4" ),
            new PinMappingStruct( 5, (1 << 8),  "LG1" ),
            new PinMappingStruct( 5, (1 << 9),  "LR1" ),
            new PinMappingStruct( 5, (1 << 10), "LY1" ),
            new PinMappingStruct( 5, (1 << 11), "LR2" ),
        };

        /// <summary>
        /// The structure for the Pin Table that is populated from the PINS section of the test vector file
        /// </summary>
        private struct PinTableStruct
        {
            public int PinColumn;      //The Column in the Test Vector File
            public String Direction;   //Input, Output, Don't Care, or Pullup
            public String FlipChipPin; //The pin on the FlipChip
            public bool Changed;       //Flag to indicate that the current test vector changed the state of this pin
        }

        private PinTableStruct[] PinTable = new PinTableStruct[NumberOfPinDrivers]; //The Pin Table, we only have 80 GPIO pins
        private UInt16[] IodirRegisters = new UInt16[8] { 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff }; //The I/O Direction Registers in the MCP23S17s start as inputs
        private UInt16[] OlatRegisters = new UInt16[8] { 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }; //The I/O Latch Registers in the MCP23S17s start low
        private UInt16[] GpioRegisters = new UInt16[8] { 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }; //The GPIO Registers in the MCP23S17s are read only
        private String[] TestVectors = new String[2000]; //A place to hold up to 2000 test vectors
        private String[] CurrentTestVector = new String[NumberOfPinDrivers]; //This holds the ones and zeros that are modified by each test vector
        private String CommentLines; //A place to save the comments
        private String PinLines; //A place to save the PIN statements
        private String IodirLine; //A place to save the IODIR line

        //**************************************************************************
        //
        // Properties for the FlipChip Tester
        //
        //**************************************************************************

        public int BusSpeed
        {
            get { return SpiBusSpeed; }
            set { SpiBusSpeed = value; }
        }

        public bool StopTestIfFaultDetected
        {
            get { return StopTestOnFault; }
            set { StopTestOnFault = value; }
        }

        public int NumberOfTestVectorsRead
        {
            get { return NumberOfTestVectors; }
            set { NumberOfTestVectors = value; }
        }

        public bool ContinuouslyLoopTest
        {
            get { return ContinuouslyLoop; }
            set { ContinuouslyLoop = value; }
        }

        //**************************************************************************
        //
        // The FlipChip Tester Constructor and Destructor
        //
        //**************************************************************************
        public FlipChipTester()
        {
            InitializeFlipChipTester(); //Get everything ready

        }
        ~FlipChipTester()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    // Release managed resources.
                }

                // Free the unmanaged resource ...

                unmanagedResource = IntPtr.Zero;

                disposed = true;
            }
        }

        //**************************************************************************
        //
        // Methods for the FlipChip Tester
        //
        //**************************************************************************

        /// <summary>
        /// Initialize the FlipChip Tester Data Structures
        /// </summary>
        public void InitializeFlipChipTester()
        {
            NumberOfPins = 0; //No Pins in the Pin Table

            for (int Pin = 0; Pin < NumberOfPinDrivers; Pin++)
                CurrentTestVector[Pin] = ""; //Clear the current test vector

            for (int i = 0; i < 8; i++) //Preset the Register values
            {
                IodirRegisters[i] = 0xffff; //The I/O Direction Registers in the MCP23S17s start as inputs
                OlatRegisters[i] = 0x0000; //The I/O Latch Registers in the MCP23S17s start low
                GpioRegisters[i] = 0x0000; //The GPIO Registers in the MCP23S17s are read only
            }
        }

        /// <summary>
        /// Initialize the FlipChip Tester hardware
        /// </summary>
        /// <returns>The messages from the initialization</returns>
        public String InitializeTestHardware()
        {
            byte[] SpiRegisterContents = new byte[2];
            UInt16 RegisterContents = 0;
            string ResponseText = "";

            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig); //Make a SPI chip handler

                //Setup the SPI chips for Hardware Address
                Gpio0.HardwareAddressEnable();

                //Set the IODIR registers all inputs
                for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    Gpio0.WriteDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.IODIR, 0xFFFF);
                }

                //Write the Hardware Address into the IOLAT register so we can read it back
                for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    RegisterContents = DeviceAddress;
                    Gpio0.WriteDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.OLAT, RegisterContents);
                }

                //Read the Hardware Address in the IOLAT register and see if it is correct
                for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    RegisterContents = Gpio0.ReadDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.OLAT);
                    if (DeviceAddress != RegisterContents)
                    {
                        ResponseText = "IC" + DeviceAddress + " failed to enable Hardware Addressing Mode.\n";
                        throw new FlipchipTesterException(FlipChipTestResult.SpiTestFailed, ResponseText);
                    }
                }

                //Clear the IOLAT registers
                for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    Gpio0.WriteDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.OLAT, 0x0000);
                }

                //Configure pin AA2 as an input so we can read the Vpp state
                RegisterContents = Gpio0.ReadDoubleRegister(IC1, (UInt16)MCP23S17.Register.IODIR); //Read the IODIR register for IC1
                //RegisterContents = (UInt16)(RegisterContents | 0x0080); //Make sure that pin AA2 is in input so we can read the Vpp state
                RegisterContents = (UInt16)(RegisterContents | PinNameToMask("AA2")); //Make sure that pin AA2 is in input so we can read the Vpp state
                Gpio0.WriteDoubleRegister(1, (UInt16)MCP23S17.Register.IODIR, RegisterContents); //Write the IODIR register for IC1

                //Make sure that Vpp power is on
                RegisterContents = Gpio0.ReadDoubleRegister(IC1, (UInt16)MCP23S17.Register.GPIO);
                //if ((RegisterContents & (UInt16)0x0080) == 0)
                if ((RegisterContents & PinNameToMask("AA2")) == 0)
                {
                    throw new FlipchipTesterException(FlipChipTestResult.VppPowerIsOff);
                }
            }
            catch (SpiChannelNotConnectedException)
            {
                throw new SpiChannelNotConnectedException(FtResult.DeviceNotFound);
            }

            return ResponseText;
        }

        /// <summary>
        /// Write the IODIR registers so we can test a FlipChip
        /// </summary>
        /// <returns></returns>
        public String SetupIodirRegisters()
        {
            string ResponseText = "";

            FtdiChannelConfig SpiConfig = new FtdiChannelConfig
            {
                ClockRate = SpiBusSpeed,
                LatencyTimer = LatencyTimer,
                configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
            };

            MCP23S17 Gpio0 = new MCP23S17(SpiConfig); //Make a SPI chip handler

            //Set the IODIR registers to the test values
            for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
            {
                Gpio0.WriteDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.IODIR, IodirRegisters[DeviceAddress]);
            }

            return ResponseText;
        }

        /// <summary>
        /// Execute a test vector
        /// </summary>
        /// <param name="VectorNumber"></param>
        /// <returns>The test results</returns>
        public string ProcessTestVector(int VectorNumber)
        {
            UInt16 Mask = 0; //The mask for this pin
            UInt16 DeviceAddress = 0; //The index for the IC
            UInt16 RegisterContents = 0;
            UInt16 LedState = 0;
            String ResponseText = "";
            String TestPin = "";
            String GpioPin = "";
            String PassFail = "";
            String PinName = "";
            bool FaultDetected = false; //Flag to indicate that we need to stop at the end of this pass

            FtdiChannelConfig SpiConfig = new FtdiChannelConfig
            {
                ClockRate = SpiBusSpeed,
                LatencyTimer = LatencyTimer,
                configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
            };

            MCP23S17 SpiGpio0 = new MCP23S17(SpiConfig); //Make a SPI chip handler

            if (VectorNumber < NumberOfTestVectors) //See if we are finished with the test vectors
            {
                for (int Pin = 0; Pin < NumberOfPins; Pin++) //Set Changed to false for all pins
                    PinTable[Pin].Changed = false;

                //Update the CurrentTestVector from this TestTector
                for (int Pin = 0; Pin < TestVectors[VectorNumber].Length; Pin++)
                {
                    TestPin = TestVectors[VectorNumber].Substring(Pin, 1); //Get a single Pin character from the Test Vector

                    if (TestPin != " " & TestPin != CurrentTestVector[Pin]) //Check if the 0, 1, X, or P changed
                        PinTable[Pin].Changed = true;

                    if (TestPin == "1" | TestPin == "0")
                    {
                        CurrentTestVector[Pin] = TestVectors[VectorNumber].Substring(Pin, 1);
                    }
                }

                LedState = SpiGpio0.ReadDoubleRegister(IC5, (UInt16)MCP23S17.Register.OLAT); //Get Register contents
                LedState = (UInt16)(LedState & 0x0F00);

                //Set the OLAT registers to zeros
                for (UInt16 i = 1; i < ICMax; i++)
                {
                    OlatRegisters[i] = 0x0000; //Clear the register bits
                }

                OlatRegisters[IC5] = (UInt16)(OlatRegisters[IC5] | LedState);

                for (int Pin = 0; Pin < NumberOfPinDrivers; Pin++)
                {
                    TestPin = CurrentTestVector[Pin]; //Get a single Pin character from the Test Vector
                    if (TestPin == "1")
                    {
                        PinName = PinTable[Pin].FlipChipPin; //Get the FlipChip pin name
                        DeviceAddress = PinNameToIC(PinName); //Get the corresponding SPI Address
                        Mask = PinNameToMask(PinName); //Get the corresponding IODIR Register Mask
                        OlatRegisters[DeviceAddress] |= Mask; //Add in the bit for this pin
                    }
                }

                //Set the OLAT registers to the test vector values
                for (UInt16 i = 1; i < ICMax; i++)
                {
                    RegisterContents = OlatRegisters[i]; //Get the OLAT that we need
                    SpiGpio0.WriteDoubleRegister(i, (UInt16)MCP23S17.Register.OLAT, RegisterContents);
                }

                ResponseText = "Processed Test Vector " + VectorNumber + "\n";

                for (int Pin = 0; Pin < NumberOfPins; Pin++)
                    ResponseText += CurrentTestVector[Pin];
                ResponseText += "\nSet the IOLAT Registers to ";

                for (DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    ResponseText += "\t0x" + SpiGpio0.ReadDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.OLAT).ToString("X4");
                }
                ResponseText += "\n";

                ResponseText += "The the IODIR Registers are ";

                for (DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    ResponseText += "\t0x" + SpiGpio0.ReadDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.IODIR).ToString("X4");
                }
                ResponseText += "\n";

                ResponseText += "The the GPIO Registers are ";

                for (DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    GpioRegisters[DeviceAddress] = SpiGpio0.ReadDoubleRegister(DeviceAddress, (UInt16)MCP23S17.Register.GPIO);
                    ResponseText += "\t0x" + GpioRegisters[DeviceAddress].ToString("X4");
                }
                ResponseText += "\n";

                for (int Pin = 0; Pin < NumberOfPins; Pin++)
                {
                    TestPin = CurrentTestVector[Pin]; //Get a single Pin logic value from the Test Vector
                    PinName = PinTable[Pin].FlipChipPin; //Get the FlipChip pin name
                    DeviceAddress = PinNameToIC(PinName); //Get the corresponding SPI Address
                    Mask = PinNameToMask(PinName); //Get the corresponding IODIR Register Mask
                    RegisterContents = (UInt16)(GpioRegisters[DeviceAddress] & Mask);

                    if (RegisterContents == 0)
                        GpioPin = "0";
                    else
                        GpioPin = "1";

                    if (TestPin == GpioPin | TestPin == "X")
                        PassFail = "";
                    else
                    {
                        PassFail = "Fail";
                        SetLedState("GREEN", "OFF"); //Turn the RED1 LED on
                        SetLedState("RED1", "ON"); //Turn the RED1 LED on
                        FaultDetected = true; //We detected a fault
                    }

                    if (PinTable[Pin].Changed)
                        ResponseText += "Pin " + PinName + " Should Be: " + TestPin + "* Was: " + GpioPin + " " + PassFail + "\n";
                    else
                        ResponseText += "Pin " + PinName + " Should Be: " + TestPin + "  Was: " + GpioPin + " " + PassFail + "\n";
                }

                if (FaultDetected & StopTestIfFaultDetected)
                    throw new FlipchipTesterException(FlipChipTestResult.InvalidTestResult, ResponseText);
            }
            else //We ran out of test vectors
                throw new FlipchipTesterException(FlipChipTestResult.FinishedWithTests);

            return ResponseText;
        }

        /// <summary>
        /// Ask the operator to select the Test Vector file, open it, and process the contents.
        /// </summary>
        /// <returns>The results of opening the Test Vector file</returns>
        public String OpenTestVectorFile()
        {
            Stream TestVectorFileStream = null;
            OpenFileDialog TestVectorOpenFileDialog = new OpenFileDialog();
            String TestVectorFileLine;
            String TestVectorFileResults = "";
            bool WeHavePinLines = false; //Flag to indicate that we found the PINS line
            bool FinishedWithComments = false; //Flag to indicate that we found the end if the initial comments
            bool FinishedWithIodir = false; //Flag to indicate we found the IODIR line

            CommentLines = "";
            PinLines = "";
            IodirLine = "";
            NumberOfTestVectors = 0;

            InitializeFlipChipTester(); //Clear everything and get ready to read in new test values

            TestVectorOpenFileDialog.InitialDirectory = "..\\tests\\";
            TestVectorOpenFileDialog.Filter = "tst files (*.TST)|*.TST|All files (*.*)|*.*";
            TestVectorOpenFileDialog.FilterIndex = 2;
            TestVectorOpenFileDialog.RestoreDirectory = true;

            if (TestVectorOpenFileDialog.ShowDialog() == DialogResult.OK) //The user selected a file
            {
                try
                {
                    if ((TestVectorFileStream = TestVectorOpenFileDialog.OpenFile()) != null) //We were able to open the file
                    {
                        using (TestVectorFileStream)
                        {
                            CommentLines = "The test vector file is: " + TestVectorOpenFileDialog.FileName + "\n\n";
                            using (StreamReader TestVectorStreamReader = new StreamReader(TestVectorFileStream))
                            {
                                while ((TestVectorFileLine = TestVectorStreamReader.ReadLine()) != null)
                                {
                                    if (WeHavePinLines & (TestVectorFileLine.Length == 0)) //No more pin lines
                                        WeHavePinLines = false;

                                    if (WeHavePinLines) //Process the PINS statements
                                    {
                                        int index = TestVectorFileLine.IndexOf(' ');
                                        if (index != -1)
                                        {
                                            String number = TestVectorFileLine.Substring(0, index);
                                        }
                                        DecodePinStatementLine(TestVectorFileLine);
                                        PinLines += TestVectorFileLine + "\n";
                                    }

                                    if (TestVectorFileLine.Length > 3)
                                        if (TestVectorFileLine.Substring(0, 4) == "PINS")
                                        {
                                            FinishedWithComments = true;
                                            WeHavePinLines = true;
                                        }

                                    if (!FinishedWithComments) //Put all of the lines up to the "PINS" line in the comments
                                        CommentLines += TestVectorFileLine + "\n";

                                    if (FinishedWithIodir & TestVectorFileLine.Length > 0)
                                    {
                                        if ((TestVectorFileLine.Substring(0, 1) != ";") & (TestVectorFileLine.Substring(0, 1) != "E")) //Check for comment and END
                                            TestVectors[NumberOfTestVectors++] = TestVectorFileLine; //Save the test vector in the test vector array.
                                    }

                                    if ((FinishedWithComments & !WeHavePinLines) & TestVectorFileLine.Length > 0) //Must be the IODIR line
                                    {
                                        if (TestVectorFileLine.Substring(0, 1) == "I" | TestVectorFileLine.Substring(0, 1) == "O")
                                        {
                                            IodirLine = TestVectorFileLine; //Save the IODIR line
                                            FinishedWithIodir = true; //We found the IODIR line, so everything else is a comment or a test vector
                                        }
                                    }

                                    TestVectorFileResults += TestVectorFileLine + "\n";
                                }
                                ProcessPinStatementLines(); //Turn the pin table into the IODIR register contents
                                CheckIodirLine(); //Compare the IodirLine to the Pin Table

                                for (int Pin = 0; Pin < NumberOfPins; Pin++)
                                    CurrentTestVector[Pin] = TestVectors[0].Substring(Pin, 1); //Load the current test vector from the first test vector in the file
                            }
                        }
                    }
                }
                catch (FlipchipTesterException ex)
                {
                    TestVectorFileResults = ex.FlipChipTestMessage; //The message about a bad pin definition
                }
                catch (ArgumentOutOfRangeException)
                {
                    TestVectorFileResults = "The Pin Table and the IODIR line in the file do not match.";
                }
                catch (Exception ex)
                {
                    TestVectorFileResults = "Error: Could not read file from disk. Original error: " + ex.Message;
                }
            }
            return TestVectorFileResults;
        }

        /// <summary>
        /// Get the saved comment lines from the Test Vector file
        /// </summary>
        /// <returns>The Comment lines</returns>
        public String GetCommentLines()
        {
            return CommentLines;
        }

        /// <summary>
        /// Get the saved Pin lines from the Test Vector file
        /// </summary>
        /// <returns>The Pin line</returns>
        public String GetPinLines()
        {
            return PinLines;
        }

        /// <summary>
        /// Get the saved IO Direction line from the Test Vector file
        /// </summary>
        /// <returns>The IO Direction line</returns>
        public String GetIodirLine()
        {
            return IodirLine;
        }

        /// <summary>
        /// Gets the saved Test Vectors
        /// </summary>
        /// <returns>Test Vectors</returns>
        public String GetTestVectors()
        {
            String TestVectorString = ""; //A place to hold the Test Vectors

            for (int Index = 0; Index < NumberOfTestVectors; Index++)
            {
                TestVectorString += "#" + (Index) + ": " + TestVectors[Index] + "\n";
            }

            return TestVectorString;
        }
        /// <summary>
        /// Enable the Hardware Addressing mode in the SPI chips
        /// and test that it worked
        /// </summary>
        /// <returns>The messages from the initialization</returns>
        public String HardwareAddressEnable()
        {
            UInt16 RegisterContents = 0;
            string ResponseText = "";

            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig);
                ResponseText += "Wrote 0x08 to all of the IOCON registers to enable Hardware Addressing Mode.\n";

                //Setup the SPI chips for Hardware Address
                Gpio0.HardwareAddressEnable();

                //Write the Hardware Address into the IOLAT register so we can read it back
                for (UInt16 i = 1; i < ICMax; i++)
                {
                    RegisterContents = i;
                    Gpio0.WriteDoubleRegister(i, (int)MCP23S17.Register.OLAT, RegisterContents);
                }
                ResponseText += "Wrote the Hardware Address into the IOLAT register so we can read it back.\n";

                //Read the Hardware Address in the IOLAT register and see if it is correct
                for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                {
                    RegisterContents = Gpio0.ReadDoubleRegister(DeviceAddress, (int)MCP23S17.Register.OLAT);
                    if (DeviceAddress != RegisterContents)
                        ResponseText += "SPI chip IC" + DeviceAddress + " contained 0x" + RegisterContents.ToString("X4") + ".\n";
                    else
                        ResponseText += "SPI chip IC" + DeviceAddress + " contained the correct value.\n"; ;
                }
            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }

            return ResponseText;
        }

        /// <summary>
        /// Decode a PINS line from the Test Vector file
        /// Check for pins that are tied high or low
        /// </summary>
        /// <param name="TestVectorLine"></param>
        public void DecodePinStatementLine(String TestVectorLine)
        {
            String ResponseText = "";
            string[] Columns = TestVectorLine.TrimStart(' ').Split(' ');
            PinTable[NumberOfPins].PinColumn = Convert.ToInt16(Columns[0]);
            PinTable[NumberOfPins].Direction = Columns[1];
            PinTable[NumberOfPins].FlipChipPin = Columns[2];
            PinTable[NumberOfPins].Changed = false; //We start out with the pin not changed

            if (PinTable[NumberOfPins].FlipChipPin == "AT1"
                | PinTable[NumberOfPins].FlipChipPin == "AA2"
                | PinTable[NumberOfPins].FlipChipPin == "AC2"
                | PinTable[NumberOfPins].FlipChipPin == "BT1"
                | PinTable[NumberOfPins].FlipChipPin == "BA2"
                | PinTable[NumberOfPins].FlipChipPin == "BC2")
            {
                ResponseText = "Pin " + PinTable[NumberOfPins].FlipChipPin + " is tied to a voltage or ground and cannot be used.";
                throw new FlipchipTesterException(FlipChipTestResult.InvalidPin, ResponseText);
            }

            NumberOfPins++; //Add a Pin to the Pin Table
        }

        /// <summary>
        /// Process the entries PinTable save the results in IodirRegisters
        /// </summary>
        public void ProcessPinStatementLines()
        {
            String PinName = ""; //The Pin Name
            UInt16 DeviceAddress = 0; //The SPI chip Address
            UInt16 IoDirMask = 0; //This Pin's bit mask

            for (int i = 0; i < NumberOfPins; i++)
            {
                if (PinTable[i].Direction == "I") //Only process inputs to the FlipChip
                {
                    PinName = PinTable[i].FlipChipPin; //Get the Pin Name
                    DeviceAddress = PinNameToIC(PinName); //Get the corresponding SPI Address
                    IoDirMask = PinNameToMask(PinName); //Get the corresponding IODIR Register Mask
                    IodirRegisters[DeviceAddress] ^= IoDirMask; //Or the mask to the IODIR Register contents
                }
            }

            IodirRegisters[IC5] = Convert.ToUInt16(IodirRegisters[IC5] & 0xF0FF); //Set the LED bits to outputs
        }

        /// <summary>
        /// Compare the I/O direction in the IodirLine to the direction in the pin table
        /// </summary>
        public void CheckIodirLine()
        {
            for (int i = 0; i < NumberOfPins; i++)
            {
                if (IodirLine.Substring(i, 1) != PinTable[i].Direction)
                    throw new ArgumentOutOfRangeException(); //The IodirLine and the Pin Table don't match
            }
        }

        /// <summary>
        /// Lookup the Pin Name in the PinMappingTable
        /// </summary>
        /// <param name="PinName"></param>
        /// <returns>The corresponding IC SPI Address</returns>
        public UInt16 PinNameToIC(String PinName)
        {
            UInt16 IcNumber = 0;

            for (int i = 0; i < NumberOfPinDrivers; i++)
            {
                if (PinName == PinMappingTable[i].PinName)
                {
                    IcNumber = PinMappingTable[i].SpiAddress;
                    break;
                }
            }

            return IcNumber;
        }

        /// <summary>
        /// Lookup the Pin Name in the PinMappingTable
        /// </summary>
        /// <param name="PinName"></param>
        /// <returns>The corresponding IODIR Register Mask</returns>
        public UInt16 PinNameToMask(String PinName)
        {
            UInt16 Mask = 0;

            for (int i = 0; i < NumberOfPinDrivers; i++)
            {
                if (PinName == PinMappingTable[i].PinName)
                {
                    Mask = PinMappingTable[i].Mask;
                    break;
                }
            }

            return Mask;
        }

        /// <summary>
        /// Cycle the LEDs on the tester through a binary pattern
        /// </summary>
        /// <returns>The results of cycling the LEDs</returns>
        public string CycleTheLEDs()
        {
            UInt16 RegisterContents = 0;
            string ResponseText = "";

            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig);
                ResponseText += "Writing to the IODIR and IOLAT registers in IC5.\n";

                RegisterContents = 0xF0FF; //Pins 1-4 are outputs
                Gpio0.WriteDoubleRegister(5, (int)MCP23S17.Register.IODIR, RegisterContents);

                //Write a count into the IOLAT register so we can read it back
                for (UInt16 i = 0; i < 16; i++)
                {
                    RegisterContents = (UInt16)(0x0000 | i << 8);
                    Gpio0.WriteDoubleRegister(5, (int)MCP23S17.Register.OLAT, RegisterContents);
                    Thread.Sleep(250);
                }
            }
            catch (SpiChannelNotConnectedException)
            {
                throw new SpiChannelNotConnectedException(FtResult.DeviceNotFound);
            }

            return ResponseText;
        }

        //**************************************************************************
        //
        // Work with the FTDI SPI USB cable DLLs and Drivers
        //
        //**************************************************************************

        /// <summary>
        /// Get the versions of the SPI and USB drivers
        /// </summary>
        /// <returns>The results of the query</returns>
        public String GetDriverVersions()
        {
            uint Version = 0;
            uint MajorVersion = 0;
            uint MinorVersion = 0;
            uint BuildVersion = 0;

            string ResponseText = "";

            FtdiStatus = FtdiUSB0.OpenByIndex(0); //We need to open one of the FTDI devices to load the driver

            if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
            {
                FtdiStatus = FtdiUSB0.GetDriverVersion(ref Version);

                if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                {
                    MajorVersion = (Version & 0x00FF0000) >> 16;
                    MinorVersion = (Version & 0x0000FF00) >> 8;
                    BuildVersion = (Version & 0x000000FF);

                    ResponseText += "The FTDIBUS.SYS driver version is: " + MajorVersion.ToString("X2") + "." +
                        MinorVersion.ToString("X2") + "." + BuildVersion.ToString("X2") + "\n";
                }
                else
                    ResponseText += "I could not get the FTDIBUS.SYS driver version.\n";

                FtdiStatus = FtdiUSB0.GetLibraryVersion(ref Version);

                if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                {
                    MajorVersion = (Version & 0x00FF0000) >> 16;
                    MinorVersion = (Version & 0x0000FF00) >> 8;
                    BuildVersion = (Version & 0x000000FF);

                    if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                        ResponseText += "The FTD2XX.dll version is: " + MajorVersion.ToString("X2") + "." +
                            MinorVersion.ToString("X2") + "." + BuildVersion.ToString("X2") + "\n";
                }
                else
                    ResponseText += "I could not get the FTD2XX.dl driver version.\n";

                FtdiStatus = FtdiUSB0.Close();
            }
            else
                ResponseText += "I could not open FTDI device " + 0 + " .\n";

            return ResponseText;
        }

        /// <summary>
        /// Find out how many FTDI USB devices we have
        /// </summary>
        /// <returns>Results of scanning for the FTDI USB devices</returns>
        public String ScanForFtdiDevices()
        {
            string ResponseText = "";

            FtdiStatus = FtdiUSB0.GetNumberOfDevices(ref FtdiDeviceCount);

            if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
            {
                ResponseText += "I found " + FtdiDeviceCount + " FTDI USB Serial devices.\n\n";

                FtdiStatus = FtdiUSB0.GetDeviceList(FtdiDeviceInfoNode);

                if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                {
                    for (uint i = 0; i < FtdiDeviceCount; i++)
                    {
                        ResponseText += "Device " + i + "\n";
                        ResponseText += "\tDescription:   " + FtdiDeviceInfoNode[i].Description + "\n";
                        ResponseText += "\tFlags:         " + FtdiDeviceInfoNode[i].Flags + "\n";
                        ResponseText += "\tID:            0x" + FtdiDeviceInfoNode[i].ID.ToString("X4") + "\n";
                        ResponseText += "\tLocation ID:   " + FtdiDeviceInfoNode[i].LocId + "\n";
                        ResponseText += "\tSerial Number: " + FtdiDeviceInfoNode[i].SerialNumber + "\n";
                        ResponseText += "\tType:          " + FtdiDeviceInfoNode[i].Type + "\n\n";
                    }
                }
                else
                    ResponseText += "I could not get a list of the FTDI USB devices.\n";

                FtdiStatus = FtdiUSB0.Close();
            }
            else
                ResponseText += "I could not find any FTDI USB devices.\n";

            return ResponseText;
        }

        /// <summary>
        /// Read all of the SPI-USB cable SEEPROMs
        /// </summary>
        /// <returns>The contents of the SPI-USB cable SEEPROMs</returns>
        public String ReadEEPROMInFTDIDevices()
        {
            string ResponseText = "";

            FtdiStatus = FtdiUSB0.GetNumberOfDevices(ref FtdiDeviceCount);

            if (FtdiStatus == FTDI.FT_STATUS.FT_OK && FtdiDeviceCount > 0)
            {
                ResponseText += "I found " + FtdiDeviceCount + " FTDI USB Serial devices.\n\n";

                FtdiStatus = FtdiUSB0.GetDeviceList(FtdiDeviceInfoNode);

                if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                {
                    for (uint i = 0; i < FtdiDeviceCount; i++)
                    {
                        FtdiStatus = FtdiUSB0.OpenByIndex(i);

                        if (FtdiStatus == FTDI.FT_STATUS.FT_OK)
                        {
                            if (FtdiDeviceInfoNode[i].Type.ToString() == "FT_DEVICE_232R")
                            {
                                FtdiStatus = FtdiUSB0.ReadFT232REEPROM(FtdiREepromStructure);

                                ResponseText += "Device " + i + "\n";
                                ResponseText += " Description:      " + FtdiREepromStructure.Description + "\n";
                                ResponseText += " Manufacturer:     " + FtdiREepromStructure.Manufacturer + "\n";
                                ResponseText += " Manufacturer ID:  " + FtdiREepromStructure.ManufacturerID + "\n";
                                ResponseText += " Maximum Power:    " + FtdiREepromStructure.MaxPower + " mA\n";
                                ResponseText += " Product ID:       0x" + FtdiREepromStructure.ProductID.ToString("X4") + "\n";
                                ResponseText += " Vendor ID:        0x" + FtdiREepromStructure.VendorID.ToString("X4") + "\n";
                                ResponseText += " Remote Wakeup:    " + FtdiREepromStructure.RemoteWakeup + "\n";
                                ResponseText += " Self Powered:     " + FtdiREepromStructure.SelfPowered + "\n";
                                ResponseText += " Serial Number:    " + FtdiREepromStructure.SerialNumber + "\n";
                                ResponseText += " Use Ext Osc:      " + FtdiREepromStructure.UseExtOsc + "\n";
                                ResponseText += " High Drive IOs:   " + FtdiREepromStructure.HighDriveIOs + "\n";
                                ResponseText += " Pull Down Enable: " + FtdiREepromStructure.PullDownEnable + "\n\n";
                            }
                            else
                            {
                                FtdiStatus = FtdiUSB0.ReadFT232HEEPROM(FtdiHEepromStructure);

                                ResponseText += "Device " + i + "\n";
                                ResponseText += " Description:      " + FtdiHEepromStructure.Description + "\n";
                                ResponseText += " Manufacturer:     " + FtdiHEepromStructure.Manufacturer + "\n";
                                ResponseText += " Manufacturer ID:  " + FtdiHEepromStructure.ManufacturerID + "\n";
                                ResponseText += " Maximum Power:    " + FtdiHEepromStructure.MaxPower + " mA\n";
                                ResponseText += " Product ID:       0x" + FtdiHEepromStructure.ProductID.ToString("X4") + "\n";
                                ResponseText += " Vendor ID:        0x" + FtdiHEepromStructure.VendorID.ToString("X4") + "\n";
                                ResponseText += " Remote Wakeup:    " + FtdiHEepromStructure.RemoteWakeup + "\n";
                                ResponseText += " Self Powered:     " + FtdiHEepromStructure.SelfPowered + "\n";
                                ResponseText += " Serial Number:    " + FtdiHEepromStructure.SerialNumber + "\n";
                                ResponseText += " Is VCP:           " + FtdiHEepromStructure.IsVCP + "\n";
                                ResponseText += " Pull Down Enable: " + FtdiHEepromStructure.PullDownEnable + "\n\n";
                            }
                            FtdiStatus = FtdiUSB0.Close();
                        }
                        else
                            ResponseText += "I could not open FTDI device " + i + ".\n";
                    }//for
                }
                else
                    ResponseText += "I could not get a device list.\n";
            }
            else
                ResponseText += "I could not find any FTDI devices.\n";

            return ResponseText;
        }

        /// <summary>
        /// Find out how many FTDI MPSSE Capable USB devices we have
        /// </summary>
        /// <returns>Results of scanning for the FTDI USB devices</returns>
        public String ScanForFtdiMpsseDevices()
        {
            string ResponseText = "";

            MpsseStatus = LibMpsseSpi.SPI_GetNumChannels(out MpsseChannelCount);

            if (MpsseStatus == FtResult.Ok)
            {
                ResponseText += "I found " + MpsseChannelCount + " FTDI USB MPSSE Serial devices.\n\n";

                if (MpsseChannelCount > 0)
                {
                    MpsseStatus = LibMpsseSpi.SPI_GetChannelInfo(MpsseChannel, out MpsseDeviceInfo);

                    if (MpsseStatus == FtResult.Ok)
                    {
                        for (uint i = 0; i < MpsseChannelCount; i++)
                        {
                            ResponseText += "Device " + i + "\n";
                            ResponseText += "\tDescription:   " + MpsseDeviceInfo.Description + "\n";
                            ResponseText += "\tFlags:         " + MpsseDeviceInfo.Flags + "\n";
                            ResponseText += "\tID:            0x" + MpsseDeviceInfo.ID.ToString("X4") + "\n";
                            ResponseText += "\tLocation ID:   " + MpsseDeviceInfo.LocId + "\n";
                            ResponseText += "\tSerial Number: " + MpsseDeviceInfo.SerialNumber + "\n";
                            ResponseText += "\tType:          " + MpsseDeviceInfo.Type + "\n\n";
                        }
                    }
                    else
                        ResponseText += "I could not get a list of the FTDI USB MPSSE Serial devices.\n";
                }
            }
            else
                ResponseText += "I could not find any FTDI USB MPSSE Serial devices.\n";

            return ResponseText;
        }

        /// <summary>
        /// Turn on the LEDs in the FTDI USB cable
        /// </summary>
        /// <returns>The results of turning the LEDs on</returns>
        public String TurnOnLEDs()
        {
            byte dir = 0xff;
            byte value = 0xb0;
            string ResponseText = "";

            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MpsseStatus = LibMpsseSpi.SPI_GetNumChannels(out MpsseChannelCount);

                if (MpsseStatus == 0 && MpsseChannelCount > 0)
                {
                    ResponseText += "I found " + MpsseChannelCount + " FTDI USB MPSSE Serial devices.\n\n";

                    MpsseStatus = LibMpsseSpi.SPI_OpenChannel(MpsseChannel, out SpiHandle);

                    if (MpsseStatus == FtResult.Ok)
                    {
                        MpsseStatus = LibMpsseSpi.FT_WriteGPIO(SpiHandle, dir, value);

                        if (MpsseStatus == FtResult.Ok)
                        {
                            ResponseText += "I turned the GPIO for the red LED on.\n\n";

                            //Thread.Sleep(500);

                            //.MpsseStatus = LibMpsseSpi.FT_ReadGPIO(.SpiHandle, out value);

                            //if (.MpsseStatus == FtResult.Ok)
                            //{
                            //    .ConsolerichTextBox.Text += "The GPIO state is " + value.ToString("X2") + ".\n\n";
                            //}
                            //else
                            //    .ConsolerichTextBox.Text += "I could not read the GPIOs state.\n\n";
                        }
                        else
                            ResponseText += "I could not change the GPIOs.\n\n";

                        MpsseStatus = LibMpsseSpi.SPI_CloseChannel(SpiHandle);
                    }
                    else
                        ResponseText += "I could not open SPI Channel " + MpsseChannel + "\n";
                }
                else
                    ResponseText += "I could not find any FTDI USB devices.\n";
            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }

            return ResponseText;
        }

        /// <summary>
        /// Turn off the LEDs in the FTDI USB cable
        /// </summary>
        /// <returns>The results of turning the LEDs off</returns>
        public String TurnOffLEDs()
        {
            byte dir = 0xff;
            byte value = 0xff;
            string ResponseText = "";

            MpsseChannel = 0; //The first MPSSE cable

            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MpsseStatus = LibMpsseSpi.SPI_GetNumChannels(out MpsseChannelCount);

                if (MpsseStatus == 0 && MpsseChannelCount > 0)
                {
                    ResponseText += "I found " + MpsseChannelCount + " FTDI USB MPSSE Serial devices.\n\n";

                    MpsseStatus = LibMpsseSpi.SPI_OpenChannel(MpsseChannel, out SpiHandle);
                    if (MpsseStatus == 0 && MpsseChannelCount > 0)
                    {
                        MpsseStatus = LibMpsseSpi.SPI_InitChannel(SpiHandle, ref SpiConfig);

                        if (MpsseStatus == FtResult.Ok)
                        {
                            MpsseStatus = LibMpsseSpi.FT_WriteGPIO(SpiHandle, dir, value);

                            if (MpsseStatus == FtResult.Ok)
                            {
                                ResponseText += "I turned all of the GPIOs off.\n\n";

                                //Thread.Sleep(500);

                                //.MpsseStatus = LibMpsseSpi.FT_ReadGPIO(.SpiHandle, out value);

                                //if (.MpsseStatus == FtResult.Ok)
                                //{
                                //    .ConsolerichTextBox.Text += "The GPIO state is " + value.ToString("X2") + ".\n\n";
                                //}
                                //else
                                //    .ConsolerichTextBox.Text += "I could not read the GPIOs state.\n\n";
                            }
                            else
                                ResponseText += "I could not change the GPIOs.\n\n";

                            MpsseStatus = LibMpsseSpi.SPI_CloseChannel(SpiHandle);
                            if (!(MpsseStatus == FtResult.Ok))
                                ResponseText += "I could not close the SPI Channel " + MpsseChannel + "\n";
                        }
                        else
                            ResponseText += "I could not initialize SPI Channel " + MpsseChannel + "\n";
                    }
                    else
                        ResponseText += "I could not open SPI Channel " + MpsseChannel + "\n";
                }
                else
                    ResponseText += "I could not find any FTDI USB devices.\n";
            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }

            return ResponseText;
        }

        //**************************************************************************
        //
        // Work with the Microchip MCP23S17 SPI GPIO device
        //
        //**************************************************************************

        /// <summary>
        /// Read all of the SPI device registers
        /// </summary>
        /// <returns>Contents of all of the SPI device registers in hex</returns>
        public String ReadMPC23S17Registers()
        {
            string ResponseText = "Register\tIC1\t\tIC2\t\tIC3\t\tIC4\t\tIC5 \n";

            try
            {
                FtdiChannelConfig SpiConfig0 = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 SpiGpio0 = new MCP23S17(SpiConfig0);

                for (UInt16 RegisterAddress = 0; RegisterAddress < 22; RegisterAddress = (UInt16)(RegisterAddress + 2))
                {
                    ResponseText += String.Format("{0,-10}", ((MCP23S17.Register)RegisterAddress).ToString());
                    for (UInt16 DeviceAddress = 1; DeviceAddress < ICMax; DeviceAddress++)
                    {
                        ResponseText += "\t0x" + SpiGpio0.ReadDoubleRegister(DeviceAddress, RegisterAddress).ToString("X4");
                    }
                    ResponseText += "\n";
                }
            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }

            return ResponseText;
        }

        /// <summary>
        /// Return the contents of the specified SPI device register in hex
        /// </summary>
        /// <param name="DeviceAddressText"></param>
        /// <param name="RegisterNameText"></param>
        /// <param name="RegisterContentsText"></param>
        /// <returns>String containing the results of the register write</returns>
        public String WriteSingleMPC23S17Register(String DeviceAddressText, String RegisterNameText, String RegisterContentsText)
        {
            byte[] SpiRegisterContents = new byte[2];
            UInt16 RegisterContents = 0;
            UInt16 RegisterNumber = 0;
            string ResponseText = "";

            try
            {
                switch (RegisterNameText)
                {
                    case "IODIR":
                        {
                            RegisterNumber = 0x00;
                            break;
                        }
                    case "IOPOL":
                        {
                            RegisterNumber = 0x02;
                            break;
                        }
                    case "GPINTEN":
                        {
                            RegisterNumber = 0x04;
                            break;
                        }
                    case "DEFVAL":
                        {
                            RegisterNumber = 0x06;
                            break;
                        }
                    case "INTCON":
                        {
                            RegisterNumber = 0x08;
                            break;
                        }
                    case "IOCON":
                        {
                            RegisterNumber = 0x0A;
                            break;
                        }
                    case "GPPU":
                        {
                            RegisterNumber = 0x0C;
                            break;
                        }
                    case "INTF":
                        {
                            RegisterNumber = 0x0E;
                            break;
                        }
                    case "INTCAP":
                        {
                            RegisterNumber = 0x10;
                            break;
                        }
                    case "GPIO":
                        {
                            RegisterNumber = 0x12;
                            break;
                        }
                    case "OLAT":
                        {
                            RegisterNumber = 0x14;
                            break;
                        }
                }

                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig);

                RegisterContents = Convert.ToUInt16(RegisterContentsText, 16);
                SpiRegisterContents[0] = Convert.ToByte(RegisterContents & 0xff);
                SpiRegisterContents[1] = Convert.ToByte(RegisterContents >> 8);
                Gpio0.WriteDoubleRegister(Convert.ToUInt16(DeviceAddressText, 16), RegisterNumber, SpiRegisterContents);

                ResponseText += "Wrote 0x" + SpiRegisterContents[0].ToString("X2") + SpiRegisterContents[1].ToString("X2") + " to " + RegisterNameText + "\n";

            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }
            return ResponseText;
        }

        /// <summary>
        /// Reset the SPI bus by toggling a USB Cable GPIO
        /// </summary>
        public String ResetSpiBus()
        {
            byte direction = 0xff; //0 is input, 1 is output
            byte value = 0xb0;
            string ResponseText = "";

            FtdiChannelConfig SpiConfig = new FtdiChannelConfig
            {
                ClockRate = SpiBusSpeed,
                LatencyTimer = LatencyTimer,
                configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
            };

            MpsseStatus = LibMpsseSpi.SPI_GetNumChannels(out MpsseChannelCount);

            if (MpsseStatus == 0 && MpsseChannelCount > 0)
            {
                MpsseStatus = LibMpsseSpi.SPI_OpenChannel(MpsseChannel, out SpiHandle);

                if (MpsseStatus == FtResult.Ok)
                {
                    MpsseStatus = LibMpsseSpi.FT_WriteGPIO(SpiHandle, direction, value);

                    if (MpsseStatus == FtResult.Ok)
                    {
                        //Thread.Sleep(500);

                        //.MpsseStatus = LibMpsseSpi.FT_ReadGPIO(.SpiHandle, out value);

                        //if (.MpsseStatus == FtResult.Ok)
                        //{
                        //    .ConsolerichTextBox.Text += "The GPIO state is " + value.ToString("X2") + ".\n\n";
                        //}
                        //else
                        //    .ConsolerichTextBox.Text += "I could not read the GPIOs state.\n\n";
                    }
                    else
                        ResponseText += "I could not change the GPIOs.\n\n";

                    MpsseStatus = LibMpsseSpi.SPI_CloseChannel(SpiHandle);
                }
                else
                    ResponseText += "I could not open SPI Channel " + MpsseChannel + "\n";
            }
            else
                ResponseText += "I could not find any FTDI USB devices.\n";

            return ResponseText;
        }

        /// <summary>
        /// Read 5x Registers 1,000 times and measure the time it takes
        /// </summary>
        /// <param name="DeviceAddressText"></param>
        /// <param name="RegisterNameText"></param>
        /// <param name="RegisterContentsText"></param>
        /// <returns>The test results</returns>
        public String Read1kMPC23S17Registers(String DeviceAddressText, String RegisterNameText, String RegisterContentsText)
        {
            string ResponseText = "";
            byte[] SpiRegisterContents = new byte[2];
            UInt16 RegisterNumber = 0;
            UInt16 RegisterContents = 0;

            try
            {
                switch (RegisterNameText)
                {
                    case "IODIR":
                        {
                            RegisterNumber = 0x00;
                            break;
                        }
                    case "IOPOL":
                        {
                            RegisterNumber = 0x02;
                            break;
                        }
                    case "GPINTEN":
                        {
                            RegisterNumber = 0x04;
                            break;
                        }
                    case "DEFVAL":
                        {
                            RegisterNumber = 0x06;
                            break;
                        }
                    case "INTCON":
                        {
                            RegisterNumber = 0x08;
                            break;
                        }
                    case "IOCON":
                        {
                            RegisterNumber = 0x0A;
                            break;
                        }
                    case "GPPU":
                        {
                            RegisterNumber = 0x0C;
                            break;
                        }
                    case "INTF":
                        {
                            RegisterNumber = 0x0E;
                            break;
                        }
                    case "INTCAP":
                        {
                            RegisterNumber = 0x10;
                            break;
                        }
                    case "GPIO":
                        {
                            RegisterNumber = 0x12;
                            break;
                        }
                    case "OLAT":
                        {
                            RegisterNumber = 0x14;
                            break;
                        }
                }

                RegisterContents = Convert.ToUInt16(RegisterContentsText, 16);
                SpiRegisterContents[0] = Convert.ToByte(RegisterContents >> 8);
                SpiRegisterContents[1] = Convert.ToByte(RegisterContents & 0xff);

                FtdiChannelConfig SpiConfig0 = new FtdiChannelConfig //Configuration for the FTDI USB cable's SPI bus
                {
                    ClockRate = SpiBusSpeed,
                    LatencyTimer = LatencyTimer, //Locally defined
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig0);

                Stopwatch timer = new Stopwatch();
                timer.Start();

                for (int i = 0; i < 1000; i++)
                {
                    Gpio0.WriteReadFiveRegisters(Convert.ToUInt16(DeviceAddressText, 16), RegisterNumber, SpiRegisterContents);
                }
                timer.Stop();
                long milliSec = timer.ElapsedMilliseconds;

                long vectorsSec = (1000 / (milliSec / 1000));

                ResponseText += "The elapsed time for 1000 sets of 5x register write/reads was " + milliSec + "ms.\n";
                ResponseText += "I can process " + vectorsSec + " vectors/second.";
            }
            catch (SpiChannelNotConnectedException)
            {
                ResponseText = "Could not connect to USB/SPI cable.";
            }

            return ResponseText;
        }

        /// <summary>
        /// Turn a LED on or off
        /// </summary>
        /// <param name="LedName">GREEN, YELLOW, RED1, or RED2</param>
        /// <param name="State">ON or OFF</param>
        public void SetLedState(String LedName, String State)
        {
            UInt16 RegisterContents = 0x0000; //Empty for now
            int Mask = 0x0000;  //Empty for now
            try
            {
                FtdiChannelConfig SpiConfig = new FtdiChannelConfig
                {
                    ClockRate = BusSpeed,
                    LatencyTimer = LatencyTimer,
                    configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
                };

                MCP23S17 Gpio0 = new MCP23S17(SpiConfig); //Make a SPI chip handler

                //Read the IOLAT register in IC 5 so we can turn on or off an LED
                RegisterContents = Gpio0.ReadDoubleRegister(IC5, (UInt16)MCP23S17.Register.OLAT);

                switch (LedName) //Determine the Mask for this LED
                {
                    case "ALL":
                        {
                            Mask = 0x0F00;
                            break;
                        }
                    case "GREEN":
                        {
                            Mask = 0x0100;
                            break;
                        }
                    case "RED1":
                        {
                            Mask = 0x0200;
                            break;
                        }
                    case "YELLOW":
                        {
                            Mask = 0x0400;
                            break;
                        }
                    case "RED2":
                        {
                            Mask = 0x0800;
                            break;
                        }
                    default: //Bad LED name, so no action
                        {
                            Mask = 0x0000;
                            break;
                        }
                }

                if (State == "ON")
                {
                    RegisterContents = (UInt16)(RegisterContents | Mask);
                }
                else if (State == "OFF")
                {
                    RegisterContents = (UInt16)(RegisterContents & ~Mask);
                }

                //Write the IOLAT register in IC 5 so we can turn a LED on or off
                Gpio0.WriteDoubleRegister(0x05, (UInt16)MCP23S17.Register.OLAT, RegisterContents);
            }
            catch (Exception)
            {
            }
        }
    }
}
