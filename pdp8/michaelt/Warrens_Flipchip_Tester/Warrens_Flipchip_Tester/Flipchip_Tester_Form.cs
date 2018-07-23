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
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Reflection;
using System.Windows.Forms;
using libMPSSEWrapper;
using libMPSSEWrapper.Types;
using libMPSSEWrapper.Exceptions;
using Warrens_Flipchip_Tester.Exceptions;
using Warrens_Flipchip_Tester.Types;

namespace Warrens_Flipchip_Tester
{
    /// <summary>
    /// The whole GUI for Warren's Flipchip Tester
    /// </summary>
    public partial class Flipchip_Tester_Form : Form
    {
        //**************************************************************************
        //
        // Globals for the tester software
        //
        //**************************************************************************

        FlipChipTester WarrensFlipChipTester = new FlipChipTester();  //Make a new instance of the FlipChip Tester
        int VectorNumber = 0; //The index for the first test vector

        /// <summary>
        /// Create the Windows Form and get the GUI going
        /// </summary>
        public Flipchip_Tester_Form()
        {
            InitializeComponent();
            BusSpeedTextBox.Text = WarrensFlipChipTester.BusSpeed.ToString();
            HelpVersionTextBox.Text = Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }

        /// <summary>
        /// The Bus Speed TextBox changed, so save the new speed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BusSpeedChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(BusSpeedTextBox.Text) > 10000000) //Make sure that the bus speed is not set to over 10 MHz
                BusSpeedTextBox.Text = "10000000";

            if (Convert.ToInt32(BusSpeedTextBox.Text) < 1000) //Make sure that the bus speed is not set to less than 1 KHz
                BusSpeedTextBox.Text = "1000";

            WarrensFlipChipTester.BusSpeed = Convert.ToInt32(BusSpeedTextBox.Text);
            DiagRichTextBox.Text = "The SPI bus is running at " + WarrensFlipChipTester.BusSpeed.ToString("N0") + " Hz";
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

        /// <summary>
        /// Read the EEPROM in all of the FTDI cables
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ReadEEPROMInFTDIDevicesbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadEEPROMInFTDIDevices();
        }

        /// <summary>
        /// Get the versions of the FTDI drivers
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void GetDriverVersionsbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.GetFtdiDriverVersions();
        }

        /// <summary>
        /// Read all of the MPC23S17 registers
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ReadMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.ReadMPC23S17Registers();
        }

        /// <summary>
        /// Read all of the MPC23S17 registers 100 times and calculate the vectors/second
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Read100kMPC23S17Registersbutton_Click(object sender, EventArgs e)
        {
            if (Environment.Is64BitOperatingSystem)
                DiagRichTextBox.Text ="The Windows Operating System is 64-bit.\n";
            else
                DiagRichTextBox.Text = "The Windows Operating System is 32-bit.\n";
            if (Environment.Is64BitProcess)
                DiagRichTextBox.Text += "The FlipChip Tester Application is 64-bit.\n";
            else
                DiagRichTextBox.Text += "The FlipChip Tester Application is 32-bit.\n";

            DiagRichTextBox.Text += "The FlipChip Tester Application version is: " + Assembly.GetExecutingAssembly().GetName().Version.ToString() + ".\n";
            DiagRichTextBox.Text += "The libMPSSEWrapper.dll version is: " + AssemblyName.GetAssemblyName(@"libMPSSEWrapper.dll").Version + ".\n";
            DiagRichTextBox.Text += WarrensFlipChipTester.GetFtdiDriverVersions();
            DiagRichTextBox.Text += WarrensFlipChipTester.ScanForFtdiMpsseDevices();
            DiagRichTextBox.Text += "The SPI bus is running at " + WarrensFlipChipTester.BusSpeed + " Hz.\n";
            Application.DoEvents(); //Get the text on the screen

            WarrensFlipChipTester.OpenUSBSpi(); //Open the USB/SPI Channel
            DiagRichTextBox.Text += WarrensFlipChipTester.Read100MPC23S17Registers();
            WarrensFlipChipTester.CloseUSBSpi(); //Close the USB/SPI Channel
        }

        /// <summary>
        /// Write one of the MPC23S17 registers
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void WriteSingleMPC23S17Registerbutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.WriteSingleMPC23S17Register(DeviceAddressNumericUpDown.Text, RegistercomboBox.SelectedItem.ToString(), RegisterContentsTextBox.Text);
        }

        /// <summary>
        /// Configure all of the MPC23S17 devices for hardware addressing
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void HardwareAddressEnablebutton_Click(object sender, EventArgs e)
        {
            DiagRichTextBox.Text = WarrensFlipChipTester.HardwareAddressEnable();

            CycleTheLEDsButton.Enabled = true; //Enable these buttons after Hardware Addressing is enabled
            ReadMPC23S17Registersbutton.Enabled = true;
            WriteSingleMPC23S17Registerbutton.Enabled = true;
        }

        /// <summary>
        /// Open and process a test vector file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OpenTestVectorFileButton_Click(object sender, EventArgs e)
        {
            TesterRichTextBox.Text = WarrensFlipChipTester.OpenTestVectorFile();
            PinTableRichTextBox.Text = WarrensFlipChipTester.GetPinLines() + "\n";
            PinTableRichTextBox.Text += WarrensFlipChipTester.GetIodirLine();
            CommentsRichTextBox.Text = WarrensFlipChipTester.GetCommentLines();
            TestVectorsRichTextBox.Text = WarrensFlipChipTester.GetTestVectors();
            TestVectorsHeaderRichTextBox.Text = WarrensFlipChipTester.GetTestVectorsHeader();
            StartingVectorNumberTextBox.Text = "1"; //Set the ending vector number to the first vector
            EndingVectorNumberTextBox.Text = "9999"; //Set the ending vector number to a high value
            StartTestButton.Enabled = true; //Turn the buttons on because we have a test vector file
            NextTestVectorButton.Enabled = false;
            ContinueTestAfterStopButton.Enabled = false;
            RunAllTestVectorsButton.Enabled = true;
        }

        /// <summary>
        /// Cycle the state of the 4x LEDs on the tester
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

        /// <summary>
        /// Initialize the hardware and execute one test vector
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void StartTestButton_Click(object sender, EventArgs e)
        {
            try
            {
                WarrensFlipChipTester.DisplayTestResults = true; //Configure the tester to display test results
                WarrensFlipChipTester.DisplayTestPinTableComments = true; //Configure the tester to display Pin Table Comments
                StartingVectorNumberTextBox.Text = "1"; //Reset the test vector number to the first one
                VectorNumber = 1;
                PassCountTextBox.Text = "0";
                TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(); //Turn on hardware addressing and test it
                TesterRichTextBox.Text += WarrensFlipChipTester.SetupIodirRegisters(); //Write the bits into the IODIR registers
                TesterRichTextBox.Text += WarrensFlipChipTester.ProcessTestVector(VectorNumber); //Process a test vector
                WarrensFlipChipTester.SetLedState("ALL", "OFF"); //Turn the Green LED on
                WarrensFlipChipTester.SetLedState("GREEN", "ON"); //Turn the Green LED on
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
                TesterRichTextBox.Text += "Try unplugging the USB/SPI cable, and the plugging it back in.\n";
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
                    TesterRichTextBox.Text += ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
                StartingVectorNumberTextBox.Text = "2"; //We only ran the first test vector, so the second is next
                NextTestVectorButton.Enabled = true;
                ContinueTestAfterStopButton.Enabled = true;
            }
        }

        /// <summary>
        /// Execute one test vector and increment the Starting Vector Number field
        /// You need to run Start Test first to initialize the hardware
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void NextTestVectorButton_Click(object sender, EventArgs e)
        {
            try
            {
                WarrensFlipChipTester.DisplayTestResults = true; //Configure the tester to display test results
                WarrensFlipChipTester.DisplayTestPinTableComments = true; //Configure the tester to display Pin Table Comments
                VectorNumber = Convert.ToInt32(StartingVectorNumberTextBox.Text);
                if (VectorNumber == WarrensFlipChipTester.NumberOfTestVectorsRead + 1)
                {
                    VectorNumber = 1;
                    StartingVectorNumberTextBox.Text = VectorNumber.ToString();
                }

                Application.DoEvents(); //Make the text show up now

                TesterRichTextBox.Text = WarrensFlipChipTester.ProcessTestVector(VectorNumber); //Process a test vector
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
                TesterRichTextBox.Text += "Try unplugging the USB/SPI cable, and the plugging it back in.\n";
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
                    TesterRichTextBox.Text += ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
                VectorNumber++;
                StartingVectorNumberTextBox.Text = VectorNumber.ToString();
            }
        }

        /// <summary>
        /// Run the remaining test vectors after the test has halted
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ContinueTestAfterStopButton_Click(object sender, EventArgs e)
        {
            try
            {
                WarrensFlipChipTester.DisplayTestResults = DisplayTestResultsRadioButton.Checked; //Configure the tester to display test results or not
                WarrensFlipChipTester.DisplayTestPinTableComments = false; //Configure the tester to not display Pin Table Comments
                WarrensFlipChipTester.SetLedState("YELLOW", "ON"); //Turn the Yellow LED on
                WarrensFlipChipTester.ContinuouslyLoopTest = ContinuouslyLoopRadioButton.Checked; //Set the flag to control looping

                do
                {
                    for (int TestVector = Convert.ToInt16(StartingVectorNumberTextBox.Text); TestVector < WarrensFlipChipTester.NumberOfTestVectorsRead + 1; TestVector++)
                    {
                        StartingVectorNumberTextBox.Text = TestVector.ToString();
                        TesterRichTextBox.Text = WarrensFlipChipTester.ProcessTestVector(TestVector); //Process a test vector
                        Application.DoEvents(); //Make the text show up now

                        if (TestVector > Convert.ToInt32(EndingVectorNumberTextBox.Text))
                        {
                            TesterRichTextBox.Text += "\nStopped at test vector number " + EndingVectorNumberTextBox.Text + " of " + (WarrensFlipChipTester.NumberOfTestVectorsRead - 1) + ".\n";
                            ContinuouslyLoopRadioButton.Checked = false; //Uncheck the button so we can stop the tester
                            DontContinuouslyLoopRadioButton.Checked = true;
                            break;
                        }
                    }
                    PassCountTextBox.Text = (Convert.ToInt32(PassCountTextBox.Text) + 1).ToString();
                    StartingVectorNumberTextBox.Text = "1"; //Reset the next test vector to run
                    SystemSounds.Beep.Play(); //Make a beep at the end of the pass
                } while (ContinuouslyLoopRadioButton.Checked);
                TesterRichTextBox.Text += "\nFinished with test vectors.\n";
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
                TesterRichTextBox.Text += "Try unplugging the USB/SPI cable, and the plugging it back in.\n";
            }
            catch (FlipchipTesterException ex)
            {
                if (ex.Reason == FlipChipTestResult.VppPowerIsOff)
                {
                    TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n\n";
                    TesterRichTextBox.Text += "Flip the toggle switch and make sure that the amber LED for UUT_PWR goes on.\n";
                }

                if (ex.Reason == FlipChipTestResult.FinishedWithTests) //We should only get here if we try to process a test vector number that is higher than what we have
                    TesterRichTextBox.Text += "\nFinished with test vectors.\n";

                if (ex.Reason == FlipChipTestResult.InvalidTestResult)
                {
                    TesterRichTextBox.Text = ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "\nFlipChip fault detected.\n";
                    StartingVectorNumberTextBox.Text = (Convert.ToInt16(StartingVectorNumberTextBox.Text) + 1).ToString(); //Its a lot of work to increment the number
                }

                if (ex.Reason == FlipChipTestResult.SpiTestFailed)
                {
                    TesterRichTextBox.Text += "SPI Chip Hardware Address Fault.\n\n";
                    TesterRichTextBox.Text += ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
            }
        }

        /// <summary>
        /// Run all of the test vectors from the beginning
        /// Loop through all of the vectors if ContinuouslyLoopRadioButton is Checked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RunAllTestVectorsButton_Click(object sender, EventArgs e)
        {
            try
            {
                WarrensFlipChipTester.DisplayTestResults = DisplayTestResultsRadioButton.Checked; //Configure the tester to display test results or not
                WarrensFlipChipTester.DisplayTestPinTableComments = false; //Configure the tester to not display Pin Table Comments
                StartingVectorNumberTextBox.Text = "1";
                PassCountTextBox.Text = "0";
                TesterRichTextBox.Text = WarrensFlipChipTester.InitializeTestHardware(); //Turn on hardware addressing and test it
                TesterRichTextBox.Text += WarrensFlipChipTester.SetupIodirRegisters(); //Write the bits into the IODIR registers
                WarrensFlipChipTester.SetLedState("ALL", "OFF"); //Turn the all LEDs off
                WarrensFlipChipTester.SetLedState("GREEN", "ON"); //Turn the Green LED on
                WarrensFlipChipTester.SetLedState("YELLOW", "ON"); //Turn the Yellow LED on
                WarrensFlipChipTester.ContinuouslyLoopTest = ContinuouslyLoopRadioButton.Checked; //Set the flag to control looping

                do
                {
                    for (int TestVector = 1; TestVector < WarrensFlipChipTester.NumberOfTestVectorsRead +1; TestVector++)
                    {
                        StartingVectorNumberTextBox.Text = TestVector.ToString();
                        TesterRichTextBox.Text = WarrensFlipChipTester.ProcessTestVector(TestVector); //Process a test vector
                        Application.DoEvents(); //Make the text show up now

                        if (TestVector > Convert.ToInt32(EndingVectorNumberTextBox.Text))
                        {
                            TesterRichTextBox.Text += "\nStopped at test vector number " + EndingVectorNumberTextBox.Text + " of " + (WarrensFlipChipTester.NumberOfTestVectorsRead - 1) + ".\n";
                            ContinuouslyLoopRadioButton.Checked = false; //Uncheck the button so we can stop the tester
                            DontContinuouslyLoopRadioButton.Checked = true;
                            break;
                        }
                    }
                    PassCountTextBox.Text = (Convert.ToInt32(PassCountTextBox.Text) + 1).ToString();
                    SystemSounds.Beep.Play(); //Make a beep at the end of the pass
                } while (ContinuouslyLoopRadioButton.Checked);
                TesterRichTextBox.Text += "\nFinished with test vectors.\n";
            }
            catch (SpiChannelNotConnectedException)
            {
                TesterRichTextBox.Text = "Could not connect to the USB/SPI cable.\n";
                TesterRichTextBox.Text += "Try unplugging the USB/SPI cable, and the plugging it back in.\n";
            }
            catch (FlipchipTesterException ex)
            {
                if (ex.Reason == FlipChipTestResult.VppPowerIsOff)
                {
                    TesterRichTextBox.Text = "The Vpp Power to the FlipChip is not turned on.\n\n";
                    TesterRichTextBox.Text += "Flip the toggle switch and make sure that the amber LED for UUT_PWR goes on.\n";
                }

                if (ex.Reason == FlipChipTestResult.FinishedWithTests) //We should only get here if we try to process a test vector number that is higher than what we have
                    TesterRichTextBox.Text += "\nFinished with test vectors.\n";

                if (ex.Reason == FlipChipTestResult.InvalidTestResult)
                {
                    TesterRichTextBox.Text = ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "\nFlipChip fault detected.\n";
                    StartingVectorNumberTextBox.Text = (Convert.ToInt16(StartingVectorNumberTextBox.Text) + 1).ToString(); //Its a lot of work to increment the number
                }

                if (ex.Reason == FlipChipTestResult.SpiTestFailed)
                {
                    TesterRichTextBox.Text += "SPI Chip Hardware Address Fault.\n\n";
                    TesterRichTextBox.Text += ex.FlipChipTestMessage;
                    TesterRichTextBox.Text += "Try disconnecting & reconnecting the USB cable and restarting the FlipChip tester program.\n";
                    TesterRichTextBox.Text += "Try running Hardware Address Enable and Test in the Test the Tester tab.\n";
                }
            }
            finally
            {
                WarrensFlipChipTester.SetLedState("YELLOW", "OFF"); //Turn the Yellow LED off
                NextTestVectorButton.Enabled = true;
                ContinueTestAfterStopButton.Enabled = true;
            }
        }

        //**************************************************************************
        //
        // Run the FlipChip Testing on a separate Thread so that the GUI remains responsive
        //
        // Not Implemented yet
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

        /// <summary>
        /// Don't let the user enter a starting vector number less than 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void StartingVectorNumberTextBox_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(StartingVectorNumberTextBox.Text) < 1)
                StartingVectorNumberTextBox.Text = "1";
        }

        /// <summary>
        /// Don't let the user enter an ending vector number less than 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EndingVectorNumberTextBox_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(EndingVectorNumberTextBox.Text) < 1)
                EndingVectorNumberTextBox.Text = "1";

        }
    }
}
