using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using FTD2XX_NET;
using libMPSSEWrapper;
using libMPSSEWrapper.Types;

namespace Warrens_Flipchip_Tester
{
    public partial class Flipchip_Tester_Form : Form
    {
        //**************************************************************************
        //
        // Support for the FTD2XX_NET DLL
        //
        //**************************************************************************

        FTDI.FT_DEVICE_INFO_NODE[] FtdiDeviceInfoNode = new FTDI.FT_DEVICE_INFO_NODE[10]; //Get read for up to 10 USB cables
        FTDI FtdiUSB0 = new FTDI(); // Create new instance of the FTDI device class
        FTDI.FT232R_EEPROM_STRUCTURE FtdiREepromStructure = new FTDI.FT232R_EEPROM_STRUCTURE();
        FTDI.FT232H_EEPROM_STRUCTURE FtdiHEepromStructure = new FTDI.FT232H_EEPROM_STRUCTURE();

        //**************************************************************************
        //
        // Support for the libMPSSEWrapper DLL
        //
        //**************************************************************************

        private const int LatencyTimer = 2; //Small value to make USB go faster

        //**************************************************************************
        //
        // Support for the MCP23S17 16-bit SPI GPIO part
        //
        //**************************************************************************

        UInt16 DeviceAddress = 0x07; //We will use a default Device Addres of 7.

        //**************************************************************************
        //
        // Globals for the tester software
        //
        //**************************************************************************

        FlipChipTester WarrensFlipChipTester = new FlipChipTester();  //Make a new instance of the FlipChip Tester

        public Flipchip_Tester_Form()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Find out how many FTDI USB devices we have
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ScanForFtdiDevicesbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ScanForFtdiDevices();
        }

        /// <summary>
        /// Find out how many FTDI MPSSE Capable USB devices we have
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ScanForFtdiMpsseDevicesbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ScanForFtdiMpsseDevices();
        }

        /// <summary>
        /// Turn on the LEDs in the FTDI USB cable
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TurnOnLEDsbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.TurnOnLEDs(BusSpeedTextBox.Text);
        }

        /// <summary>
        /// Turn off the LEDs in the FTDI USB cable
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TurnOffLEDsbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.TurnOffLEDs(BusSpeedTextBox.Text);
        }

        private void ReadEEPROMInFTDIDevicesbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadEEPROMInFTDIDevices();
        }

        private void GetDriverVersionsbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.GetDriverVersions();
        }

        private void ReadMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadMPC23S17Registers(BusSpeedTextBox.Text, DeviceAddressNumericUpDown.Text);
        }

        private void Read1kMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            byte[] SpiRegisterContents = new byte[2];
            UInt16 RegisterContents = 0;

            DiagRichTextBox.Text = "Reading 1000 registers.\n";
            DiagRichTextBox.Text += "The SPI bus is running at " + Convert.ToInt32(BusSpeedTextBox.Text) + "Hz.\n";
            Application.DoEvents();

            DeviceAddress = Convert.ToUInt16(DeviceAddressNumericUpDown.Text, 16);

            RegisterContents = Convert.ToUInt16(RegisterContentsTextBox.Text, 16);
            SpiRegisterContents[0] = Convert.ToByte(RegisterContents >> 8);
            SpiRegisterContents[1] = Convert.ToByte(RegisterContents & 0xff);

            FtdiChannelConfig SpiConfig0 = new FtdiChannelConfig //Configuration for the FTDI USB cable's SPI bus
            {
                ClockRate = Convert.ToInt32(BusSpeedTextBox.Text),
                LatencyTimer = LatencyTimer, //Locally defined
                configOptions = FtdiConfigOptions.Mode0 | FtdiConfigOptions.CsDbus3 | FtdiConfigOptions.CsActivelow
            };

            MCP23S17 Gpio0 = new MCP23S17(SpiConfig0);

            Stopwatch timer = new Stopwatch();
            timer.Start();

            for (int i = 0; i < 1000; i++)
            {
                Gpio0.WriteReadFiveRegisters(DeviceAddress, RegistercomboBox.SelectedIndex * 2, SpiRegisterContents);
            }
            timer.Stop();
            long milliSec = timer.ElapsedMilliseconds;

            long vectorsSec = (1000 / (milliSec / 1000));

            DiagRichTextBox.Text += "The elapsed time for 1000 sets of 5x register write/reads was " + milliSec + "ms.\n";
            DiagRichTextBox.Text += "I can do: " + vectorsSec + " vectors/second.";
        }

        private void WriteSingleMPC23S17Registerbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.WriteSingleMPC23S17Register(BusSpeedTextBox.Text, DeviceAddressNumericUpDown.Text, RegistercomboBox.SelectedItem.ToString(), RegisterContentsTextBox.Text);
        }

        private void HardwareAddressEnablebutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.HardwareAddressEnable(BusSpeedTextBox.Text);
        }

        private void OpenTestVectorFileButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.OpenTestVectorFile();
        }

        private void InitializeTestHardwareButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(BusSpeedTextBox.Text);
        }

        private void DisplayTheCommentsButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.GetCommentLines();
        }

        private void DisplayThePinTableButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.GetPinLines();
        }

        private void CycleTheLEDsButton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = "Sending binary pattern to the LEDs\n";
            Application.DoEvents(); //Make sure that the message gets displayed
            WarrensFlipChipTester.CycleTheLEDs(BusSpeedTextBox.Text);
            DiagRichTextBox.Text += "Done.";
        }
    }
}
