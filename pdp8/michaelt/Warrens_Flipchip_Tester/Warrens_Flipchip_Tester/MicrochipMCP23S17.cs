/* 
    Copyright (C) 2018, The Rhode Island Computer Museum

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    Author(s):
        Michael Thompson <mike@ricomputermuseum.org>

 */

using System;
using System.Diagnostics;
using libMPSSEWrapper.Spi;
using libMPSSEWrapper.Types;

namespace Warrens_Flipchip_Tester
{
    /// <summary>
    /// The definition of the MCP23S17 device
    /// </summary>
    public class MCP23S17 : SpiDevice
    {
        byte[] ControlWordAndRegister = new byte[2]; //A place to hold the Control Word and Register Address
        byte[] SingleRegisterContents = new byte[1]; //A place to hold the register contents that we just read
        byte[] DoubleRegisterContents = new byte[2]; //A place to hold the register contents that we just read

        /// <summary>
        /// The Register Addresses
        /// </summary>
        [Flags]
        public enum Register
        {
            /// <summary>
            /// The MCP23S17 IODIR Register
            /// </summary>
            IODIR = 0x00,    //This assumes that IOCON.BANK = 0 so that the chip works in Byte Mode
            /// <summary>
            /// The MCP23S17 IPOL Register
            /// </summary>
            IPOL = 0x02,
            /// <summary>
            /// The MCP23S17 GPINTEN Register
            /// </summary>
            GPINTEN = 0x04,
            /// <summary>
            /// The MCP23S17 DEFVAL Register
            /// </summary>
            DEFVAL = 0x06,
            /// <summary>
            /// The MCP23S17 INTCON Register
            /// </summary>
            INTCON = 0x08,
            /// <summary>
            /// The MCP23S17 IOCON Register
            /// </summary>
            IOCON = 0x0A,
            /// <summary>
            /// The MCP23S17 GPPU Register
            /// </summary>
            GPPU = 0x0C,
            /// <summary>
            /// The MCP23S17 INTF Register
            /// </summary>
            INTF = 0x0E,
            /// <summary>
            /// The MCP23S17 INTCAP Register
            /// </summary>
            INTCAP = 0x10,
            /// <summary>
            /// The MCP23S17 GPIO Register
            /// </summary>
            GPIO = 0x12,
            /// <summary>
            /// The MCP23S17 OLAT Register
            /// </summary>
            OLAT = 0x14,
        }

        /// <summary>
        /// The bits for the IODIR Register
        /// </summary>
        [Flags]
        public enum IODIR //0x00
        {
            /// <summary>
            /// The MCP23S17 IODIR Register bit 7
            /// </summary>
            IO7IN = 0x80,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 6
            /// </summary>
            IO6IN = 0x40,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 5
            /// </summary>
            IO5IN = 0x20,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 4
            /// </summary>
            IO4IN = 0x10,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 3
            /// </summary>
            IO3IN = 0x08,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 2
            /// </summary>
            IO2IN = 0x04,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 1
            /// </summary>
            IO1IN = 0x02,
            /// <summary>
            /// The MCP23S17 IODIR Register bit 0
            /// </summary>
            IO0IN = 0x01,
        }

        /// <summary>
        /// The bits for the IPOL Register
        /// </summary>
        [Flags]
        public enum IPOL //0x02
        {
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 7
            /// </summary>
            IP7 = 0x80,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 6
            /// </summary>
            IP6 = 0x40,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 5
            /// </summary>
            IP5 = 0x20,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 4
            /// </summary>
            IP4 = 0x10,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 3
            /// </summary>
            IP3 = 0x08,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 2
            /// </summary>
            IP2 = 0x04,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 1
            /// </summary>
            IP1 = 0x02,
            /// <summary>
            /// The MCP23S17 IOPOL Register bit 0
            /// </summary>
            IP0 = 0x01,
        }

        /// <summary>
        /// The bits for the GPINTEN Register
        /// </summary>
        [Flags]
        public enum GPINTEN //0x04
        {
            /// <summary>
            /// The MCP23S17 GPINT Register bit 7
            /// </summary>
            GPINT7 = 0x80,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT6 = 0x40,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT5 = 0x20,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT4 = 0x10,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT3 = 0x08,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT2 = 0x04,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT1 = 0x02,
            /// <summary>
            /// The MCP23S17 GPINT Register bit 8
            /// </summary>
            GPINT0 = 0x01,
        }

        /// <summary>
        /// The bits for the DEFVAL Register
        /// </summary>
        [Flags]
        public enum DEFVAL //0x06
        {
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 7
            /// </summary>
            DEF7 = 0x80,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 6
            /// </summary>
            DEF6 = 0x40,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 5
            /// </summary>
            DEF5 = 0x20,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 4
            /// </summary>
            DEF4 = 0x10,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 3
            /// </summary>
            DEF3 = 0x08,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 2
            /// </summary>
            DEF2 = 0x04,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 1
            /// </summary>
            DEF1 = 0x02,
            /// <summary>
            /// The MCP23S17 DEFVAL Register bit 0
            /// </summary>
            DEF0 = 0x01,
        }

        /// <summary>
        /// The bits for the INTCon Register
        /// </summary>
        [Flags]
        public enum INTCON //0x08
        {
            /// <summary>
            /// The MCP23S17 INTCON Register bit 7
            /// </summary>
            IOC7 = 0x80,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 6
            /// </summary>
            IOC6 = 0x40,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 5
            /// </summary>
            IOC5 = 0x20,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 4
            /// </summary>
            IOC4 = 0x10,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 3
            /// </summary>
            IOC3 = 0x08,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 2
            /// </summary>
            IOC2 = 0x04,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 1
            /// </summary>
            IOC1 = 0x02,
            /// <summary>
            /// The MCP23S17 INTCON Register bit 0
            /// </summary>
            IOC0 = 0x01,
        }

        /// <summary>
        /// The bits for the IOCON Register
        /// </summary>
        [Flags]
        public enum IOCON //0x0A or 0x0B
        {
            /// <summary>
            /// The MCP23S17 IOCON Register for BANK
            /// </summary>
            BANK = 0x80,
            /// <summary>
            /// The MCP23S17 IOCON Register for MIRROT
            /// </summary>
            MIRROR = 0x40,
            /// <summary>
            /// The MCP23S17 IOCON Register for SEQOP
            /// </summary>
            SEQOP = 0x20,
            /// <summary>
            /// The MCP23S17 IOCON Register for DISSLW
            /// </summary>
            DISSLW = 0x10,
            /// <summary>
            /// The MCP23S17 IOCON Register for HAEN
            /// </summary>
            HAEN = 0x08,
            /// <summary>
            /// The MCP23S17 IOCON Register for ODR
            /// </summary>
            ODR = 0x04,
            /// <summary>
            /// The MCP23S17 IOCON Register for INTPOL
            /// </summary>
            INTPOL = 0x02,
        }

        /// <summary>
        /// The bits for the GPPU Register
        /// </summary>
        [Flags]
        public enum GPPU //0x0C
        {
            /// <summary>
            /// The MCP23S17 GPPU Register bit 7
            /// </summary>
            PU7 = 0x80,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 6
            /// </summary>
            PU6 = 0x40,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 5
            /// </summary>
            PU5 = 0x20,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 4
            /// </summary>
            PU4 = 0x10,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 3
            /// </summary>
            PU3 = 0x08,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 2
            /// </summary>
            PU2 = 0x04,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 1
            /// </summary>
            PU1 = 0x02,
            /// <summary>
            /// The MCP23S17 GPPU Register bit 0
            /// </summary>
            PU0 = 0x01,
        }

        /// <summary>
        /// The bits for the INTF Register
        /// </summary>
        [Flags]
        public enum INTF //0x0E
        {
            /// <summary>
            /// The MCP23S17 INTF Register bit 7
            /// </summary>
            INT7 = 0x80,
            /// <summary>
            /// The MCP23S17 INTF Register bit 6
            /// </summary>
            INT6 = 0x40,
            /// <summary>
            /// The MCP23S17 INTF Register bit 5
            /// </summary>
            INT5 = 0x20,
            /// <summary>
            /// The MCP23S17 INTF Register bit 4
            /// </summary>
            INT4 = 0x10,
            /// <summary>
            /// The MCP23S17 INTF Register bit 3
            /// </summary>
            INT3 = 0x08,
            /// <summary>
            /// The MCP23S17 INTF Register bit 2
            /// </summary>
            INT2 = 0x04,
            /// <summary>
            /// The MCP23S17 INTF Register bit 1
            /// </summary>
            INT1 = 0x02,
            /// <summary>
            /// The MCP23S17 INTF Register bit 0
            /// </summary>
            INT0 = 0x01,
        }

        /// <summary>
        /// </summary>
        [Flags]
        public enum INTCAP //0x10
        {
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 7
            /// </summary>
            ICP7 = 0x80,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 6
            /// </summary>
            ICP6 = 0x40,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 5
            /// </summary>
            ICP5 = 0x20,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 4
            /// </summary>
            ICP4 = 0x10,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 3
            /// </summary>
            ICP3 = 0x08,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 2
            /// </summary>
            ICP2 = 0x04,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 1
            /// </summary>
            ICP1 = 0x02,
            /// <summary>
            /// The MCP23S17 INTCAP Register bit 0
            /// </summary>
            ICP0 = 0x01,
        }

        /// <summary>
        /// The bits for the GPIO Register
        /// </summary>
        [Flags]
        public enum GPIO //0x12
        {
            /// <summary>
            /// The MCP23S17 GPIO Register bit 7
            /// </summary>
            GP7 = 0x80,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 6
            /// </summary>
            GP6 = 0x40,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 5
            /// </summary>
            GP5 = 0x20,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 4
            /// </summary>
            GP4 = 0x10,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 3
            /// </summary>
            GP3 = 0x08,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 2
            /// </summary>
            GP2 = 0x04,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 1
            /// </summary>
            GP1 = 0x02,
            /// <summary>
            /// The MCP23S17 GPIO Register bit 0
            /// </summary>
            GP0 = 0x01,
        }

        /// <summary>
        /// The bits for the Output Latch Register
        /// </summary>
        [Flags]
        public enum OLAT //0x14
        {
            /// <summary>
            /// The MCP23S17 OLAT Register bit 7
            /// </summary>
            OL7 = 0x80,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 6
            /// </summary>
            OL6 = 0x40,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 5
            /// </summary>
            OL5 = 0x20,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 4
            /// </summary>
            OL4 = 0x10,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 3
            /// </summary>
            OL3 = 0x08,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 2
            /// </summary>
            OL2 = 0x04,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 1
            /// </summary>
            OL1 = 0x02,
            /// <summary>
            /// The MCP23S17 OLAT Register bit 0
            /// </summary>
            OL0 = 0x01,
        }

        /// <summary>
        /// Create an MSP23S17
        /// </summary>
        /// <param name="config"></param>
        public MCP23S17(FtdiChannelConfig config)
            : this(config, null)
        {
        }

        /// <summary>
        /// Create an MSP23S17
        /// </summary>
        /// <param name="config"></param>
        /// <param name="spiConfig"></param>
        public MCP23S17(FtdiChannelConfig config, SpiConfiguration spiConfig)
            : base(config, spiConfig)
        {
        }

        /// <summary>
        /// Read a 16-bit register
        /// </summary>
        /// <param name="DeviceAddress">[0..7]</param>
        /// <param name="Register">Even value in the range of [0..14]</param>
        /// <returns></returns>
        public UInt16 ReadDoubleRegister(UInt16 DeviceAddress, UInt16 Register)
        {
            int sizeTransfered = 0;
            int ControlWord = 0x41; //0100rrr1 for this device type, and a read

            ControlWord |= DeviceAddress << 1; //Device Address

            ControlWordAndRegister[0] = (byte)ControlWord;
            ControlWordAndRegister[1] = (byte)Register;

            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            return Convert.ToUInt16(DoubleRegisterContents[0] | DoubleRegisterContents[1] << 8);
        }

        /// <summary>
        /// Write a 16-bit register
        /// </summary>
        /// <param name="DeviceAddress">[0..7]</param>
        /// <param name="Register">Even value in the range of [0..14]</param>
        /// <param name="RegisterContents">2 byte array containing the register contents</param>
        public void WriteDoubleRegister(UInt16 DeviceAddress, UInt16 Register, byte[] RegisterContents)
        {
            int sizeTransfered = 0;
            int ControlWord = 0x40; //0x0100aaa0 for this device type and a write

            if (DeviceAddress < 0 | DeviceAddress > 7)
                throw new System.ArgumentOutOfRangeException("Device Address", "The Device Address must be between 0 and 7.");

            if (Register < 0 | Register > 0x14)
                throw new System.ArgumentOutOfRangeException("Register", "The Register must be between 0 and 14.");

            if (Register % 2 != 0)
                throw new System.ArgumentException("Register", "The Register must be an even number.");

            if (RegisterContents.Length != 2)
                throw new System.ArgumentException("RegisterContents", "The RegisterContents must be a two byte array.");

            ControlWord |= DeviceAddress << 1; //Device Address

            ControlWordAndRegister[0] = (byte)ControlWord;
            ControlWordAndRegister[1] = (byte)Register;

            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            return;
        }

        /// <summary>
        /// Write a 16-bit register
        /// </summary>
        /// <param name="DeviceAddress">[0..7]</param>
        /// <param name="Register">Even value in the range of [0..14]</param>
        /// <param name="RegisterContents">UInt16 containing the register contents</param>
        public void WriteDoubleRegister(UInt16 DeviceAddress, UInt16 Register, UInt16 RegisterContents)
        {
            int sizeTransfered = 0;
            int ControlWord = 0x40; //0x0100rrr0 for this device type and a write

            if (DeviceAddress < 0 | DeviceAddress > 7)
                throw new System.ArgumentOutOfRangeException("Device Address", "The Device Address must be between 0 and 7.");

            if (Register < 0 | Register > 0x14)
                throw new System.ArgumentOutOfRangeException("Register", "The Register must be between 0 and 14.");

            if (Register % 2 != 0)
                throw new System.ArgumentException("Register", "The Register must be an even number.");


            ControlWord |= DeviceAddress << 1; //Add the Device Address
            ControlWordAndRegister[0] = (byte)ControlWord;
            ControlWordAndRegister[1] = (byte)Register;

            DoubleRegisterContents[0] = (byte)(RegisterContents & 0x00ff);
            DoubleRegisterContents[1] = (byte)((RegisterContents & 0xff00) >> 8);

            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            return;
        }

        /// <summary>
        /// Write and then read 5x SPI registers for a speed test
        /// </summary>
        /// <returns>Timing information.</returns>
        public String WriteReadFiveRegisters()
        {
            String TimerResults = "";
            var sizeTransfered = 0;
            int Address = 0x01; //Starting device address
            int ControlWord = 0x40; //0100aaa0 to write this device type
            int DeviceAddress = 0;
            byte[] RegisterContents = new byte[2] { 0x55, 0x55 };

            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            ControlWordAndRegister[1] = (byte)Register.OLAT;

            Stopwatch SpiWriteTimer = new Stopwatch(); //The timer for a SPI Register Write
            Stopwatch SpiReadTimer = new Stopwatch(); //The timer for a SPI Register Read

            //5x Register writes
            SpiWriteTimer.Start(); SpiWriteTimer.Start();
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            SpiWriteTimer.Stop();
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            ControlWord = 0x41; //0100aaa1 to read this device type
            Address = 0x01; //Starting device address
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;

            //5x Register Reads
            SpiReadTimer.Start();
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            SpiReadTimer.Stop();
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Address++;
            DeviceAddress = Address << 1; //Device Address
            ControlWordAndRegister[0] = (byte)(ControlWord | DeviceAddress); //Device Address;
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            if (Stopwatch.IsHighResolution)
            {
                double Frequency = Stopwatch.Frequency;
                double MicrosecondsPerTick = (1000L * 1000L) / Frequency;
                double WriteMicroSeconds = SpiWriteTimer.ElapsedTicks * MicrosecondsPerTick;
                double ReadMicroSeconds = SpiReadTimer.ElapsedTicks * MicrosecondsPerTick;

                TimerResults += "The Timer is High Resolution.\n";
                TimerResults += "The Timer Frequency is " +  Frequency  + " Hz.\n";
                TimerResults += "One SPI Write took " + Convert.ToInt64(WriteMicroSeconds) + " microseconds.\n";
                TimerResults += "One SPI Read took " + Convert.ToInt64(ReadMicroSeconds) + " microseconds.\n";
            }
            else
                TimerResults += "Sorry, no high-resolution timer is available.\n";

            return TimerResults;
        }

        /// <summary>
        /// Enable Hardware Addressing in the SPI chip and check that it worked
        /// </summary>
        public void HardwareAddressEnable()
        {
            int sizeTransfered = 0;

            ControlWordAndRegister[0] = (byte)0x40; //0x0100rrr0 for this device type and a write
            ControlWordAndRegister[1] = (byte)MCP23S17.Register.IOCON;

            SingleRegisterContents[0] = 0x00 | (byte)MCP23S17.IOCON.HAEN;

            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(SingleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            ControlWordAndRegister[0] = (byte)0x4E; //0x0100rrr0 for this device type and a write

            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(SingleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            return;
        }
    }
}
