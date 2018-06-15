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
    public class MCP23S17 : SpiDevice
    {
        byte[] ControlWordAndRegister = new byte[2]; //A place to hold the Control Word and Register Address
        byte[] SingleRegisterContents = new byte[1]; //A place to hold the register contents that we just read
        byte[] DoubleRegisterContents = new byte[2]; //A place to hold the register contents that we just read

        [Flags]
        public enum Register
        {
            IODIR = 0x00,    //This assumes that IOCON.BANK = 0 so that the chip works in Byte Mode
            IPOL = 0x02,
            GPINTEN = 0x04,
            DEFVAL = 0x06,
            INTCON = 0x08,
            IOCON = 0x0A,
            GPPU = 0x0C,
            INTF = 0x0E,
            INTCAP = 0x10,
            GPIO = 0x12,
            OLAT = 0x14,
        }

        [Flags]
        public enum IODIR //0x00
        {
            IO7IN = 0x80,
            IO6IN = 0x40,
            IO5IN = 0x20,
            IO4IN = 0x10,
            IO3IN = 0x08,
            IO2IN = 0x04,
            IO1IN = 0x02,
            IO0IN = 0x01,
        }

        [Flags]
        public enum IPOL //0x02
        {
            IP7 = 0x80,
            IP6 = 0x40,
            IP5 = 0x20,
            IP4 = 0x10,
            IP3 = 0x08,
            IP2 = 0x04,
            IP1 = 0x02,
            IP0 = 0x01,
        }

        [Flags]
        public enum GPINTEN //0x04
        {
            GPINT7 = 0x80,
            GPINT6 = 0x40,
            GPINT5 = 0x20,
            GPINT4 = 0x10,
            GPINT3 = 0x08,
            GPINT2 = 0x04,
            GPINT1 = 0x02,
            GPINT0 = 0x01,
        }

        [Flags]
        public enum DEFVAL //0x06
        {
            DEF7 = 0x80,
            DEF6 = 0x40,
            DEF5 = 0x20,
            DEF4 = 0x10,
            DEF3 = 0x08,
            DEF2 = 0x04,
            DEF1 = 0x02,
            DEF0 = 0x01,
        }

        [Flags]
        public enum INTCON //0x08
        {
            IOC7 = 0x80,
            IOC6 = 0x40,
            IOC5 = 0x20,
            IOC4 = 0x10,
            IOC3 = 0x08,
            IOC2 = 0x04,
            IOC1 = 0x02,
            IOC0 = 0x01,
        }

        [Flags]
        public enum IOCON //0x0A or 0x0B
        {
            BANK = 0x80,
            MIRROR = 0x40,
            SEQOP = 0x20,
            DISSLW = 0x10,
            HAEN = 0x08,
            ODR = 0x04,
            INTPOL = 0x02,
        }

        [Flags]
        public enum GPPU //0x0C
        {
            PU7 = 0x80,
            PU6 = 0x40,
            PU5 = 0x20,
            PU4 = 0x10,
            PU3 = 0x08,
            PU2 = 0x04,
            PU1 = 0x02,
            PU0 = 0x01,
        }

        [Flags]
        public enum INTF //0x0E
        {
            INT7 = 0x80,
            INT6 = 0x40,
            INT5 = 0x20,
            INT4 = 0x10,
            INT3 = 0x08,
            INT2 = 0x04,
            INT1 = 0x02,
            INT0 = 0x01,
        }

        [Flags]
        public enum INTCAP //0x10
        {
            ICP7 = 0x80,
            ICP6 = 0x40,
            ICP5 = 0x20,
            ICP4 = 0x10,
            ICP3 = 0x08,
            ICP2 = 0x04,
            ICP1 = 0x02,
            ICP0 = 0x01,
        }

        [Flags]
        public enum GPIO //0x12
        {
            GP7 = 0x80,
            GP6 = 0x40,
            GP5 = 0x20,
            GP4 = 0x10,
            GP3 = 0x08,
            GP2 = 0x04,
            GP1 = 0x02,
            GP0 = 0x01,
        }

        [Flags]
        public enum OLAT //0x14
        {
            OL7 = 0x80,
            OL6 = 0x40,
            OL5 = 0x20,
            OL4 = 0x10,
            OL3 = 0x08,
            OL2 = 0x04,
            OL1 = 0x02,
            OL0 = 0x01,
        }

        public MCP23S17(FtdiChannelConfig config)
            : this(config, null)
        {
        }

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
            int ControlWord = 0x40; //0x0100rrr0 for this device type and a write

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

        public int WriteReadFiveRegisters(int DeviceAddress, int Register, byte[] RegisterContents)
        {
            var sizeTransfered = 0;
            int ControlWord = 0x40; //0100rrr1 for this device type
   
            ControlWord |= DeviceAddress << 1; //Device Address
            ControlWordAndRegister[0] = (byte)ControlWord;
            ControlWordAndRegister[1] = (byte)Register;

            //5x Register writes
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Write(RegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            ControlWord |= 1; //Add the read bit
            ControlWordAndRegister[0] = (byte)ControlWord;

            //5x Register Reads
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);
            Write(ControlWordAndRegister, out sizeTransfered, FtSpiTransferOptions.ChipselectEnable);
            Read(DoubleRegisterContents, out sizeTransfered, FtSpiTransferOptions.ChipselectDisable);

            return (DoubleRegisterContents[0] << 8 | DoubleRegisterContents[1]);
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
