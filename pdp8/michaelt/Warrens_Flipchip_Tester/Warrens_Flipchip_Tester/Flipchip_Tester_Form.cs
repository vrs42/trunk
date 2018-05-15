/*      -*- c# -*-
 *
 * Copyright (C) 2018, The Rhode Island Computer Museum
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * Author(s):
 *      Michael Thompson <mike@ricomputermuseum.com>
 */
 
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
using libMPSSEWrapper.Exceptions;

namespace Warrens_Flipchip_Tester
{
    public partial class Flipchip_Tester_Form : Form
    {
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
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadMPC23S17Registers(BusSpeedTextBox.Text);
        }

        private void Read1kMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = "The SPI bus is running at " + Convert.ToInt32(BusSpeedTextBox.Text) + "Hz.\n" + "Reading 5x registers 1000 times.\n";

            Application.DoEvents();

            DiagRichTextBox.Text += WarrensFlipChipTester.Read1kMPC23S17Registers(BusSpeedTextBox.Text, DeviceAddressNumericUpDown.Text, RegistercomboBox.SelectedItem.ToString(), RegisterContentsTextBox.Text);
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

        private void DisplayTheCommentsButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.GetCommentLines();
        }

        private void DisplayThePinTableButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.GetPinLines() + "\n";
            TesterRichTextBox.Text += WarrensFlipChipTester.GetIodirLine() + "\n";
        }

        private void CycleTheLEDsButton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = "Sending binary pattern to the LEDs\n";
            Application.DoEvents(); //Make sure that the message gets displayed

            WarrensFlipChipTester.CycleTheLEDs(BusSpeedTextBox.Text);

            DiagRichTextBox.Text += "Done.";
        }

        private void StartTestButton_Click(object sender, EventArgs e)
        {
            try
            {
                TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(BusSpeedTextBox.Text); //Turn on hardware addressing and test it
                TesterRichTextBox.Text += WarrensFlipChipTester.SetupIodirRegisters(BusSpeedTextBox.Text); //Write the bits into the IODIR registers

            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
            }
            catch (InvalidOperationException)
            {
                TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n";
            }
        }
    }
}
