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
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using libMPSSEWrapper;
using libMPSSEWrapper.Types;
using libMPSSEWrapper.Exceptions;
using Warrens_Flipchip_Tester.Exceptions;
using Warrens_Flipchip_Tester.Types;

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
        int VectorNumber = 0; //The index for the first test vector

        public Flipchip_Tester_Form()
        {
            InitializeComponent();
            BusSpeedTextBox.Text = WarrensFlipChipTester.BusSpeed.ToString();
        }

        /// <summary>
        /// The Bus Speed TextBox changed, so save the new speed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BusSpeedChanged(object sender, EventArgs e)
        {
            WarrensFlipChipTester.BusSpeed = Convert.ToInt32(BusSpeedTextBox.Text);
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
            DiagRichTextBox.Text = WarrensFlipChipTester.TurnOnLEDs();
        }

        /// <summary>
        /// Turn off the LEDs in the FTDI USB cable
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TurnOffLEDsbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.TurnOffLEDs();
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
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadMPC23S17Registers();
        }

        private void Read1kMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = "The SPI bus is running at " + WarrensFlipChipTester.BusSpeed + "Hz.\n" + "Reading 5x registers 1000 times.\n";

            Application.DoEvents();

            DiagRichTextBox.Text += WarrensFlipChipTester.Read1kMPC23S17Registers(DeviceAddressNumericUpDown.Text, RegistercomboBox.SelectedItem.ToString(), RegisterContentsTextBox.Text);
        }

        private void WriteSingleMPC23S17Registerbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.WriteSingleMPC23S17Register(DeviceAddressNumericUpDown.Text, RegistercomboBox.SelectedItem.ToString(), RegisterContentsTextBox.Text);
        }

        private void HardwareAddressEnablebutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.HardwareAddressEnable();

            CycleTheLEDsButton.Enabled = true; //Enable these buttons after Harware Addressing is enabled
            ReadMPC23S17Registersbutton.Enabled = true;
            WriteSingleMPC23S17Registerbutton.Enabled = true;
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

        private void DisplayTheTestVectorsButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.GetTestVectors() + "\n";
        }

        private void CycleTheLEDsButton_Click(object sender, EventArgs e)
        {
            try
            {
                DiagRichTextBox.Text = "Sending binary pattern to the LEDs\n";
                Application.DoEvents(); //Make sure that the message gets displayed

                WarrensFlipChipTester.CycleTheLEDs();

                DiagRichTextBox.Text += "Done.";
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
            }
        }

        private void StartTestButton_Click(object sender, EventArgs e)
        {
            try
            {
                VectorNumberTextBox.Text = "0";
                VectorNumber = 0;
                TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(); //Turn on hardware addressing and test it
                TesterRichTextBox.Text += WarrensFlipChipTester.SetupIodirRegisters(); //Write the bits into the IODIR registers
                TesterRichTextBox.Text += WarrensFlipChipTester.ProcessTestVector(VectorNumber); //Process a test vector
                WarrensFlipChipTester.SetLedState("ALL", "OFF"); //Turn the Green LED on
                WarrensFlipChipTester.SetLedState("GREEN", "ON"); //Turn the Green LED on
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
            }
            catch (FlipchipTesterException ex)
            {
                if (ex.Reason == FlipChipTestResult.VppPowerIsOff)
                {
                    TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n\n";
                    TesterRichTextBox.Text += "Flip the toggle switch and make sure that the amber LED for UUT_PWR goes on.\n";
                }

                if (ex.Reason == FlipChipTestResult.FinishedWithTests)
                    TesterRichTextBox.Text += "\nFinished with test vectors.\n";

                if (ex.Reason == FlipChipTestResult.InvalidTestResult)
                {
                    TesterRichTextBox.Text = ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "\nFlipChip fault detected.\n";
                }

                if (ex.Reason == FlipChipTestResult.SpiTestFailed)
                {
                    TesterRichTextBox.Text = "SPI Chip Hardware Address Fault.\n\n";
                    TesterRichTextBox.Text += "One of the MCP23S17 ICs could not be configured for Hardware Addressing.\n";
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
            }
        }

        private void NextTestVectorButton_Click(object sender, EventArgs e)
        {
            try
            {
                VectorNumber = Convert.ToInt32(VectorNumberTextBox.Text);
                VectorNumber++;
                VectorNumberTextBox.Text = VectorNumber.ToString();
                Application.DoEvents(); //Make the text show up now

                TesterRichTextBox.Text = WarrensFlipChipTester.ProcessTestVector(VectorNumber); //Process a test vector
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
            }
            catch (FlipchipTesterException ex)
            {
                if (ex.Reason == FlipChipTestResult.VppPowerIsOff)
                {
                    TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n\n";
                    TesterRichTextBox.Text += "Flip the toggle switch and make sure that the amber LED for UUT_PWR goes on.\n";
                }

                if (ex.Reason == FlipChipTestResult.FinishedWithTests)
                    TesterRichTextBox.Text += "\nFinished with test vectors.\n";

                if (ex.Reason == FlipChipTestResult.InvalidTestResult)
                {
                    TesterRichTextBox.Text = ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "\nFlipChip fault detected.\n";
                }

                if (ex.Reason == FlipChipTestResult.SpiTestFailed)
                {
                    TesterRichTextBox.Text += "SPI Chip Hardware Address Fault.\n\n";
                    TesterRichTextBox.Text += "One of the MCP23S17 ICs could not be configured for Hardware Addressing.\n";
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
            }
        }

        private void RunAllTestVectorsButton_Click(object sender, EventArgs e)
        {
            try
            {
                VectorNumberTextBox.Text = "0";
                VectorNumber = 0;
                TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(); //Turn on hardware addressing and test it
                TesterRichTextBox.Text += WarrensFlipChipTester.SetupIodirRegisters(); //Write the bits into the IODIR registers
                WarrensFlipChipTester.SetLedState("ALL", "OFF"); //Turn the all LEDs off
                WarrensFlipChipTester.SetLedState("GREEN", "ON"); //Turn the Green LED on
                WarrensFlipChipTester.SetLedState("YELLOW", "ON"); //Turn the Yellow LED on

                for (int Vector = 0; Vector < 2000; Vector++)
                {
                    TesterRichTextBox.Text = WarrensFlipChipTester.ProcessTestVector(VectorNumber); //Process a test vector
                    VectorNumber++;
                    VectorNumberTextBox.Text = VectorNumber.ToString();
                    Application.DoEvents(); //Make the text show up now
                }
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
            }
            catch (FlipchipTesterException ex)
            {
                if (ex.Reason == FlipChipTestResult.VppPowerIsOff)
                {
                    TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n\n";
                    TesterRichTextBox.Text += "Flip the toggle switch and make sure that the amber LED for UUT_PWR goes on.\n";
                }

                if (ex.Reason == FlipChipTestResult.FinishedWithTests)
                    TesterRichTextBox.Text += "\nFinished with test vectors.\n";

                if (ex.Reason == FlipChipTestResult.InvalidTestResult)
                {
                    TesterRichTextBox.Text = ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "\nFlipChip fault detected.\n";
                }

                if (ex.Reason == FlipChipTestResult.SpiTestFailed)
                {
                    TesterRichTextBox.Text += "SPI Chip Hardware Address Fault.\n\n";
                    TesterRichTextBox.Text += "One of the MCP23S17 ICs could not be configured for Hardware Addressing.\n";
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
            }
        }

        //**************************************************************************
        //
        // Run the FlipChip Testing on a separate Thread so that the GUI remains responsive
        //
        //**************************************************************************

        /// <summary>
        /// Spin off a Thread to perform the FlipChip test
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RunFlipChipTest(object sender, DoWorkEventArgs e)
        {
            TesterRichTextBox.Text += "\nStarting FlipChip Test Thread.\n";
        }

        /// <summary>
        /// Get and display a status update from the FlipChip tester
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FlipChipTestStatus(object sender, ProgressChangedEventArgs e)
        {
            TesterRichTextBox.Text += "\nProcessed test vector # x.\n";
        }

        /// <summary>
        /// Display the FlipChip test results
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FlipChipTestCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            TesterRichTextBox.Text += "\nFinished with test vectors.\n";
        }

        /// <summary>
        /// The StopTestIfFaultDetected radio button was changed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void StopTestIfFaultDetected_Changed(object sender, EventArgs e)
        {
            WarrensFlipChipTester.StopTestIfFaultDetected = StopTestIfFaultDetectedRadioButton.Checked;
        }
    }
}
