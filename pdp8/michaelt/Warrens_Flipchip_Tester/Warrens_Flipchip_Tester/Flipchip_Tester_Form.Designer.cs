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

 namespace Warrens_Flipchip_Tester
{
    partial class Flipchip_Tester_Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
                WarrensFlipChipTester.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Flipchip_Tester_Form));
            this.DiagRichTextBox = new System.Windows.Forms.RichTextBox();
            this.ScanForFTDIDevicesbutton = new System.Windows.Forms.Button();
            this.ReadEEPROMInFTDIDevicesbutton = new System.Windows.Forms.Button();
            this.ReadMPC23S17Registersbutton = new System.Windows.Forms.Button();
            this.GetDriverVersionsbutton = new System.Windows.Forms.Button();
            this.ScanForFtdiMpsseDevicesbutton = new System.Windows.Forms.Button();
            this.TurnOnLEDsbutton = new System.Windows.Forms.Button();
            this.TurnOffLEDsbutton = new System.Windows.Forms.Button();
            this.RegistercomboBox = new System.Windows.Forms.ComboBox();
            this.Read10kMPC23S17Registersbutton = new System.Windows.Forms.Button();
            this.WriteSingleMPC23S17Registerbutton = new System.Windows.Forms.Button();
            this.RegisterContentsTextBox = new System.Windows.Forms.TextBox();
            this.Registerlabel = new System.Windows.Forms.Label();
            this.DeviceAddresslabel = new System.Windows.Forms.Label();
            this.RegisterContentslabel = new System.Windows.Forms.Label();
            this.BusSpeedTextBox = new System.Windows.Forms.TextBox();
            this.BusSpeedlabel = new System.Windows.Forms.Label();
            this.HardwareAddressEnablebutton = new System.Windows.Forms.Button();
            this.FlipChipTesterTabControl = new System.Windows.Forms.TabControl();
            this.TestingTabPage = new System.Windows.Forms.TabPage();
            this.DisplayTestResultsGroupBox1 = new System.Windows.Forms.GroupBox();
            this.DontDisplayTestResultsRadioButton = new System.Windows.Forms.RadioButton();
            this.DisplayTestResultsRadioButton = new System.Windows.Forms.RadioButton();
            this.ContinueTestAfterStopButton = new System.Windows.Forms.Button();
            this.PassCountlabel = new System.Windows.Forms.Label();
            this.PassCountTextBox = new System.Windows.Forms.TextBox();
            this.ContinuousLoopGroupBox = new System.Windows.Forms.GroupBox();
            this.DontContinuouslyLoopRadioButton = new System.Windows.Forms.RadioButton();
            this.ContinuouslyLoopRadioButton = new System.Windows.Forms.RadioButton();
            this.EndingVectorNumberLabel = new System.Windows.Forms.Label();
            this.EndingVectorNumberTextBox = new System.Windows.Forms.TextBox();
            this.StopTestIfFaultDetectedGroupBox = new System.Windows.Forms.GroupBox();
            this.DontStopTestIfFaultDetectedRadioButton = new System.Windows.Forms.RadioButton();
            this.StopTestIfFaultDetectedRadioButton = new System.Windows.Forms.RadioButton();
            this.RunAllTestVectorsButton = new System.Windows.Forms.Button();
            this.StartingVectorNumberLabel = new System.Windows.Forms.Label();
            this.StartingVectorNumberTextBox = new System.Windows.Forms.TextBox();
            this.NextTestVectorButton = new System.Windows.Forms.Button();
            this.StartTestButton = new System.Windows.Forms.Button();
            this.SaveTestInformationInLogFileButton = new System.Windows.Forms.Button();
            this.OpenTestVectorFileButton = new System.Windows.Forms.Button();
            this.TesterRichTextBox = new System.Windows.Forms.RichTextBox();
            this.PinTableTabPage = new System.Windows.Forms.TabPage();
            this.PinTableRichTextBox = new System.Windows.Forms.RichTextBox();
            this.CommentsTabPage = new System.Windows.Forms.TabPage();
            this.CommentsRichTextBox = new System.Windows.Forms.RichTextBox();
            this.TestVectorsTabPage = new System.Windows.Forms.TabPage();
            this.TestVectorsHeaderRichTextBox = new System.Windows.Forms.RichTextBox();
            this.TestVectorsRichTextBox = new System.Windows.Forms.RichTextBox();
            this.DiagsTabPage = new System.Windows.Forms.TabPage();
            this.DeviceAddressNumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.CycleTheLEDsButton = new System.Windows.Forms.Button();
            this.HelpTabPage = new System.Windows.Forms.TabPage();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.FlipChipTestBackgroundWorker = new System.ComponentModel.BackgroundWorker();
            this.FlipChipTesterTabControl.SuspendLayout();
            this.TestingTabPage.SuspendLayout();
            this.DisplayTestResultsGroupBox1.SuspendLayout();
            this.ContinuousLoopGroupBox.SuspendLayout();
            this.StopTestIfFaultDetectedGroupBox.SuspendLayout();
            this.PinTableTabPage.SuspendLayout();
            this.CommentsTabPage.SuspendLayout();
            this.TestVectorsTabPage.SuspendLayout();
            this.DiagsTabPage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DeviceAddressNumericUpDown)).BeginInit();
            this.HelpTabPage.SuspendLayout();
            this.SuspendLayout();
            // 
            // DiagRichTextBox
            // 
            this.DiagRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.DiagRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.DiagRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DiagRichTextBox.Location = new System.Drawing.Point(258, 6);
            this.DiagRichTextBox.Name = "DiagRichTextBox";
            this.DiagRichTextBox.Size = new System.Drawing.Size(1147, 598);
            this.DiagRichTextBox.TabIndex = 1;
            this.DiagRichTextBox.Text = "";
            // 
            // ScanForFTDIDevicesbutton
            // 
            this.ScanForFTDIDevicesbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ScanForFTDIDevicesbutton.Location = new System.Drawing.Point(6, 6);
            this.ScanForFTDIDevicesbutton.Name = "ScanForFTDIDevicesbutton";
            this.ScanForFTDIDevicesbutton.Size = new System.Drawing.Size(230, 23);
            this.ScanForFTDIDevicesbutton.TabIndex = 2;
            this.ScanForFTDIDevicesbutton.Text = "Scan for FTDI USB Devices";
            this.ScanForFTDIDevicesbutton.UseVisualStyleBackColor = true;
            this.ScanForFTDIDevicesbutton.Click += new System.EventHandler(this.ScanForFtdiDevicesbutton_Click);
            // 
            // ReadEEPROMInFTDIDevicesbutton
            // 
            this.ReadEEPROMInFTDIDevicesbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ReadEEPROMInFTDIDevicesbutton.Location = new System.Drawing.Point(6, 64);
            this.ReadEEPROMInFTDIDevicesbutton.Name = "ReadEEPROMInFTDIDevicesbutton";
            this.ReadEEPROMInFTDIDevicesbutton.Size = new System.Drawing.Size(230, 23);
            this.ReadEEPROMInFTDIDevicesbutton.TabIndex = 3;
            this.ReadEEPROMInFTDIDevicesbutton.Text = "Read EEPROM in FTDI USB Devices";
            this.ReadEEPROMInFTDIDevicesbutton.UseVisualStyleBackColor = true;
            this.ReadEEPROMInFTDIDevicesbutton.Click += new System.EventHandler(this.ReadEEPROMInFTDIDevicesbutton_Click);
            // 
            // ReadMPC23S17Registersbutton
            // 
            this.ReadMPC23S17Registersbutton.Enabled = false;
            this.ReadMPC23S17Registersbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ReadMPC23S17Registersbutton.Location = new System.Drawing.Point(5, 209);
            this.ReadMPC23S17Registersbutton.Name = "ReadMPC23S17Registersbutton";
            this.ReadMPC23S17Registersbutton.Size = new System.Drawing.Size(230, 23);
            this.ReadMPC23S17Registersbutton.TabIndex = 4;
            this.ReadMPC23S17Registersbutton.Text = "Read MPC23S17 Registers";
            this.ReadMPC23S17Registersbutton.UseVisualStyleBackColor = true;
            this.ReadMPC23S17Registersbutton.Click += new System.EventHandler(this.ReadMPC23S17Registersbutton_Click);
            // 
            // GetDriverVersionsbutton
            // 
            this.GetDriverVersionsbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GetDriverVersionsbutton.Location = new System.Drawing.Point(6, 93);
            this.GetDriverVersionsbutton.Name = "GetDriverVersionsbutton";
            this.GetDriverVersionsbutton.Size = new System.Drawing.Size(230, 23);
            this.GetDriverVersionsbutton.TabIndex = 5;
            this.GetDriverVersionsbutton.Text = "Get FTDI USB Driver Versions";
            this.GetDriverVersionsbutton.UseVisualStyleBackColor = true;
            this.GetDriverVersionsbutton.Click += new System.EventHandler(this.GetDriverVersionsbutton_Click);
            // 
            // ScanForFtdiMpsseDevicesbutton
            // 
            this.ScanForFtdiMpsseDevicesbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ScanForFtdiMpsseDevicesbutton.Location = new System.Drawing.Point(6, 35);
            this.ScanForFtdiMpsseDevicesbutton.Name = "ScanForFtdiMpsseDevicesbutton";
            this.ScanForFtdiMpsseDevicesbutton.Size = new System.Drawing.Size(230, 23);
            this.ScanForFtdiMpsseDevicesbutton.TabIndex = 6;
            this.ScanForFtdiMpsseDevicesbutton.Text = "Scan for FTDI MPSSE USB Devices";
            this.ScanForFtdiMpsseDevicesbutton.UseVisualStyleBackColor = true;
            this.ScanForFtdiMpsseDevicesbutton.Click += new System.EventHandler(this.ScanForFtdiMpsseDevicesbutton_Click);
            // 
            // TurnOnLEDsbutton
            // 
            this.TurnOnLEDsbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TurnOnLEDsbutton.Location = new System.Drawing.Point(6, 122);
            this.TurnOnLEDsbutton.Name = "TurnOnLEDsbutton";
            this.TurnOnLEDsbutton.Size = new System.Drawing.Size(230, 23);
            this.TurnOnLEDsbutton.TabIndex = 7;
            this.TurnOnLEDsbutton.Text = "Turn On FTDI Red LED";
            this.TurnOnLEDsbutton.UseVisualStyleBackColor = true;
            this.TurnOnLEDsbutton.Click += new System.EventHandler(this.TurnOnLEDsbutton_Click);
            // 
            // TurnOffLEDsbutton
            // 
            this.TurnOffLEDsbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TurnOffLEDsbutton.Location = new System.Drawing.Point(6, 151);
            this.TurnOffLEDsbutton.Name = "TurnOffLEDsbutton";
            this.TurnOffLEDsbutton.Size = new System.Drawing.Size(230, 23);
            this.TurnOffLEDsbutton.TabIndex = 8;
            this.TurnOffLEDsbutton.Text = "Turn Off FTDI Red LED";
            this.TurnOffLEDsbutton.UseVisualStyleBackColor = true;
            this.TurnOffLEDsbutton.Click += new System.EventHandler(this.TurnOffLEDsbutton_Click);
            // 
            // RegistercomboBox
            // 
            this.RegistercomboBox.FormattingEnabled = true;
            this.RegistercomboBox.Items.AddRange(new object[] {
            "IODIR",
            "IPOL",
            "GPINTEN",
            "DEFVAL",
            "INTCON",
            "IOCON",
            "GPPU",
            "INTF",
            "INTCAP",
            "GPIO",
            "OLAT"});
            this.RegistercomboBox.Location = new System.Drawing.Point(5, 318);
            this.RegistercomboBox.Name = "RegistercomboBox";
            this.RegistercomboBox.Size = new System.Drawing.Size(109, 21);
            this.RegistercomboBox.TabIndex = 9;
            this.RegistercomboBox.Text = "IODIR";
            // 
            // Read10kMPC23S17Registersbutton
            // 
            this.Read10kMPC23S17Registersbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Read10kMPC23S17Registersbutton.Location = new System.Drawing.Point(6, 470);
            this.Read10kMPC23S17Registersbutton.Name = "Read10kMPC23S17Registersbutton";
            this.Read10kMPC23S17Registersbutton.Size = new System.Drawing.Size(230, 23);
            this.Read10kMPC23S17Registersbutton.TabIndex = 10;
            this.Read10kMPC23S17Registersbutton.Text = "Read MPC23S17 Registers 100 Times";
            this.Read10kMPC23S17Registersbutton.UseVisualStyleBackColor = true;
            this.Read10kMPC23S17Registersbutton.Click += new System.EventHandler(this.Read100kMPC23S17Registersbutton_Click);
            // 
            // WriteSingleMPC23S17Registerbutton
            // 
            this.WriteSingleMPC23S17Registerbutton.Enabled = false;
            this.WriteSingleMPC23S17Registerbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.WriteSingleMPC23S17Registerbutton.Location = new System.Drawing.Point(6, 238);
            this.WriteSingleMPC23S17Registerbutton.Name = "WriteSingleMPC23S17Registerbutton";
            this.WriteSingleMPC23S17Registerbutton.Size = new System.Drawing.Size(230, 23);
            this.WriteSingleMPC23S17Registerbutton.TabIndex = 12;
            this.WriteSingleMPC23S17Registerbutton.Text = "Write a singleMPC23S17 Register";
            this.WriteSingleMPC23S17Registerbutton.UseVisualStyleBackColor = true;
            this.WriteSingleMPC23S17Registerbutton.Click += new System.EventHandler(this.WriteSingleMPC23S17Registerbutton_Click);
            // 
            // RegisterContentsTextBox
            // 
            this.RegisterContentsTextBox.Location = new System.Drawing.Point(5, 358);
            this.RegisterContentsTextBox.Name = "RegisterContentsTextBox";
            this.RegisterContentsTextBox.Size = new System.Drawing.Size(108, 20);
            this.RegisterContentsTextBox.TabIndex = 13;
            this.RegisterContentsTextBox.Text = "0000";
            // 
            // Registerlabel
            // 
            this.Registerlabel.AutoSize = true;
            this.Registerlabel.Location = new System.Drawing.Point(3, 302);
            this.Registerlabel.Name = "Registerlabel";
            this.Registerlabel.Size = new System.Drawing.Size(46, 13);
            this.Registerlabel.TabIndex = 14;
            this.Registerlabel.Text = "Register";
            // 
            // DeviceAddresslabel
            // 
            this.DeviceAddresslabel.AutoSize = true;
            this.DeviceAddresslabel.Location = new System.Drawing.Point(6, 381);
            this.DeviceAddresslabel.Name = "DeviceAddresslabel";
            this.DeviceAddresslabel.Size = new System.Drawing.Size(82, 13);
            this.DeviceAddresslabel.TabIndex = 15;
            this.DeviceAddresslabel.Text = "Device Address";
            // 
            // RegisterContentslabel
            // 
            this.RegisterContentslabel.AutoSize = true;
            this.RegisterContentslabel.Location = new System.Drawing.Point(6, 342);
            this.RegisterContentslabel.Name = "RegisterContentslabel";
            this.RegisterContentslabel.Size = new System.Drawing.Size(124, 13);
            this.RegisterContentslabel.TabIndex = 16;
            this.RegisterContentslabel.Text = "Register Contents in Hex";
            // 
            // BusSpeedTextBox
            // 
            this.BusSpeedTextBox.Location = new System.Drawing.Point(5, 435);
            this.BusSpeedTextBox.Name = "BusSpeedTextBox";
            this.BusSpeedTextBox.Size = new System.Drawing.Size(108, 20);
            this.BusSpeedTextBox.TabIndex = 19;
            this.BusSpeedTextBox.Text = "1000000";
            this.BusSpeedTextBox.TextChanged += new System.EventHandler(this.BusSpeedChanged);
            // 
            // BusSpeedlabel
            // 
            this.BusSpeedlabel.AutoSize = true;
            this.BusSpeedlabel.Location = new System.Drawing.Point(6, 419);
            this.BusSpeedlabel.Name = "BusSpeedlabel";
            this.BusSpeedlabel.Size = new System.Drawing.Size(86, 13);
            this.BusSpeedlabel.TabIndex = 18;
            this.BusSpeedlabel.Text = "Bus Speed in Hz";
            // 
            // HardwareAddressEnablebutton
            // 
            this.HardwareAddressEnablebutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.HardwareAddressEnablebutton.Location = new System.Drawing.Point(6, 267);
            this.HardwareAddressEnablebutton.Name = "HardwareAddressEnablebutton";
            this.HardwareAddressEnablebutton.Size = new System.Drawing.Size(230, 23);
            this.HardwareAddressEnablebutton.TabIndex = 20;
            this.HardwareAddressEnablebutton.Text = "Hardware Address Enable and Test";
            this.HardwareAddressEnablebutton.UseVisualStyleBackColor = true;
            this.HardwareAddressEnablebutton.Click += new System.EventHandler(this.HardwareAddressEnablebutton_Click);
            // 
            // FlipChipTesterTabControl
            // 
            this.FlipChipTesterTabControl.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.FlipChipTesterTabControl.Controls.Add(this.TestingTabPage);
            this.FlipChipTesterTabControl.Controls.Add(this.PinTableTabPage);
            this.FlipChipTesterTabControl.Controls.Add(this.CommentsTabPage);
            this.FlipChipTesterTabControl.Controls.Add(this.TestVectorsTabPage);
            this.FlipChipTesterTabControl.Controls.Add(this.DiagsTabPage);
            this.FlipChipTesterTabControl.Controls.Add(this.HelpTabPage);
            this.FlipChipTesterTabControl.Location = new System.Drawing.Point(12, 12);
            this.FlipChipTesterTabControl.Name = "FlipChipTesterTabControl";
            this.FlipChipTesterTabControl.SelectedIndex = 0;
            this.FlipChipTesterTabControl.Size = new System.Drawing.Size(1419, 657);
            this.FlipChipTesterTabControl.TabIndex = 21;
            // 
            // TestingTabPage
            // 
            this.TestingTabPage.Controls.Add(this.DisplayTestResultsGroupBox1);
            this.TestingTabPage.Controls.Add(this.ContinueTestAfterStopButton);
            this.TestingTabPage.Controls.Add(this.PassCountlabel);
            this.TestingTabPage.Controls.Add(this.PassCountTextBox);
            this.TestingTabPage.Controls.Add(this.ContinuousLoopGroupBox);
            this.TestingTabPage.Controls.Add(this.EndingVectorNumberLabel);
            this.TestingTabPage.Controls.Add(this.EndingVectorNumberTextBox);
            this.TestingTabPage.Controls.Add(this.StopTestIfFaultDetectedGroupBox);
            this.TestingTabPage.Controls.Add(this.RunAllTestVectorsButton);
            this.TestingTabPage.Controls.Add(this.StartingVectorNumberLabel);
            this.TestingTabPage.Controls.Add(this.StartingVectorNumberTextBox);
            this.TestingTabPage.Controls.Add(this.NextTestVectorButton);
            this.TestingTabPage.Controls.Add(this.StartTestButton);
            this.TestingTabPage.Controls.Add(this.SaveTestInformationInLogFileButton);
            this.TestingTabPage.Controls.Add(this.OpenTestVectorFileButton);
            this.TestingTabPage.Controls.Add(this.TesterRichTextBox);
            this.TestingTabPage.ForeColor = System.Drawing.SystemColors.ControlText;
            this.TestingTabPage.Location = new System.Drawing.Point(4, 22);
            this.TestingTabPage.Name = "TestingTabPage";
            this.TestingTabPage.Padding = new System.Windows.Forms.Padding(3);
            this.TestingTabPage.Size = new System.Drawing.Size(1411, 631);
            this.TestingTabPage.TabIndex = 0;
            this.TestingTabPage.Text = "FlipChip Testing";
            this.TestingTabPage.UseVisualStyleBackColor = true;
            // 
            // DisplayTestResultsGroupBox1
            // 
            this.DisplayTestResultsGroupBox1.Controls.Add(this.DontDisplayTestResultsRadioButton);
            this.DisplayTestResultsGroupBox1.Controls.Add(this.DisplayTestResultsRadioButton);
            this.DisplayTestResultsGroupBox1.Location = new System.Drawing.Point(9, 542);
            this.DisplayTestResultsGroupBox1.Name = "DisplayTestResultsGroupBox1";
            this.DisplayTestResultsGroupBox1.Size = new System.Drawing.Size(230, 60);
            this.DisplayTestResultsGroupBox1.TabIndex = 22;
            this.DisplayTestResultsGroupBox1.TabStop = false;
            this.DisplayTestResultsGroupBox1.Text = "Display Test Results for Each Test Vector";
            // 
            // DontDisplayTestResultsRadioButton
            // 
            this.DontDisplayTestResultsRadioButton.AutoSize = true;
            this.DontDisplayTestResultsRadioButton.Location = new System.Drawing.Point(6, 41);
            this.DontDisplayTestResultsRadioButton.Name = "DontDisplayTestResultsRadioButton";
            this.DontDisplayTestResultsRadioButton.Size = new System.Drawing.Size(39, 17);
            this.DontDisplayTestResultsRadioButton.TabIndex = 15;
            this.DontDisplayTestResultsRadioButton.Text = "No";
            this.DontDisplayTestResultsRadioButton.UseVisualStyleBackColor = true;
            // 
            // DisplayTestResultsRadioButton
            // 
            this.DisplayTestResultsRadioButton.AutoSize = true;
            this.DisplayTestResultsRadioButton.Checked = true;
            this.DisplayTestResultsRadioButton.Location = new System.Drawing.Point(6, 18);
            this.DisplayTestResultsRadioButton.Name = "DisplayTestResultsRadioButton";
            this.DisplayTestResultsRadioButton.Size = new System.Drawing.Size(43, 17);
            this.DisplayTestResultsRadioButton.TabIndex = 14;
            this.DisplayTestResultsRadioButton.TabStop = true;
            this.DisplayTestResultsRadioButton.Text = "Yes";
            this.DisplayTestResultsRadioButton.UseVisualStyleBackColor = true;
            // 
            // ContinueTestAfterStopButton
            // 
            this.ContinueTestAfterStopButton.Enabled = false;
            this.ContinueTestAfterStopButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ContinueTestAfterStopButton.Location = new System.Drawing.Point(6, 146);
            this.ContinueTestAfterStopButton.Name = "ContinueTestAfterStopButton";
            this.ContinueTestAfterStopButton.Size = new System.Drawing.Size(230, 23);
            this.ContinueTestAfterStopButton.TabIndex = 21;
            this.ContinueTestAfterStopButton.Text = "Continue Test After Stop";
            this.ContinueTestAfterStopButton.UseVisualStyleBackColor = true;
            this.ContinueTestAfterStopButton.Click += new System.EventHandler(this.ContinueTestAfterStopButton_Click);
            // 
            // PassCountlabel
            // 
            this.PassCountlabel.AutoSize = true;
            this.PassCountlabel.Location = new System.Drawing.Point(6, 256);
            this.PassCountlabel.Name = "PassCountlabel";
            this.PassCountlabel.Size = new System.Drawing.Size(61, 13);
            this.PassCountlabel.TabIndex = 20;
            this.PassCountlabel.Text = "Pass Count";
            // 
            // PassCountTextBox
            // 
            this.PassCountTextBox.Location = new System.Drawing.Point(6, 272);
            this.PassCountTextBox.Name = "PassCountTextBox";
            this.PassCountTextBox.Size = new System.Drawing.Size(230, 20);
            this.PassCountTextBox.TabIndex = 19;
            this.PassCountTextBox.Text = "0";
            // 
            // ContinuousLoopGroupBox
            // 
            this.ContinuousLoopGroupBox.Controls.Add(this.DontContinuouslyLoopRadioButton);
            this.ContinuousLoopGroupBox.Controls.Add(this.ContinuouslyLoopRadioButton);
            this.ContinuousLoopGroupBox.Location = new System.Drawing.Point(9, 476);
            this.ContinuousLoopGroupBox.Name = "ContinuousLoopGroupBox";
            this.ContinuousLoopGroupBox.Size = new System.Drawing.Size(230, 60);
            this.ContinuousLoopGroupBox.TabIndex = 17;
            this.ContinuousLoopGroupBox.TabStop = false;
            this.ContinuousLoopGroupBox.Text = "Continuously Loop Through Test";
            // 
            // DontContinuouslyLoopRadioButton
            // 
            this.DontContinuouslyLoopRadioButton.AutoSize = true;
            this.DontContinuouslyLoopRadioButton.Location = new System.Drawing.Point(6, 41);
            this.DontContinuouslyLoopRadioButton.Name = "DontContinuouslyLoopRadioButton";
            this.DontContinuouslyLoopRadioButton.Size = new System.Drawing.Size(39, 17);
            this.DontContinuouslyLoopRadioButton.TabIndex = 15;
            this.DontContinuouslyLoopRadioButton.Text = "No";
            this.DontContinuouslyLoopRadioButton.UseVisualStyleBackColor = true;
            // 
            // ContinuouslyLoopRadioButton
            // 
            this.ContinuouslyLoopRadioButton.AutoSize = true;
            this.ContinuouslyLoopRadioButton.Checked = true;
            this.ContinuouslyLoopRadioButton.Location = new System.Drawing.Point(6, 18);
            this.ContinuouslyLoopRadioButton.Name = "ContinuouslyLoopRadioButton";
            this.ContinuouslyLoopRadioButton.Size = new System.Drawing.Size(43, 17);
            this.ContinuouslyLoopRadioButton.TabIndex = 14;
            this.ContinuouslyLoopRadioButton.TabStop = true;
            this.ContinuouslyLoopRadioButton.Text = "Yes";
            this.ContinuouslyLoopRadioButton.UseVisualStyleBackColor = true;
            // 
            // EndingVectorNumberLabel
            // 
            this.EndingVectorNumberLabel.AutoSize = true;
            this.EndingVectorNumberLabel.Location = new System.Drawing.Point(6, 340);
            this.EndingVectorNumberLabel.Name = "EndingVectorNumberLabel";
            this.EndingVectorNumberLabel.Size = new System.Drawing.Size(114, 13);
            this.EndingVectorNumberLabel.TabIndex = 18;
            this.EndingVectorNumberLabel.Text = "Ending Vector Number";
            // 
            // EndingVectorNumberTextBox
            // 
            this.EndingVectorNumberTextBox.Location = new System.Drawing.Point(6, 358);
            this.EndingVectorNumberTextBox.Name = "EndingVectorNumberTextBox";
            this.EndingVectorNumberTextBox.Size = new System.Drawing.Size(230, 20);
            this.EndingVectorNumberTextBox.TabIndex = 17;
            this.EndingVectorNumberTextBox.Text = "9999";
            this.EndingVectorNumberTextBox.TextChanged += new System.EventHandler(this.EndingVectorNumberTextBox_TextChanged);
            // 
            // StopTestIfFaultDetectedGroupBox
            // 
            this.StopTestIfFaultDetectedGroupBox.Controls.Add(this.DontStopTestIfFaultDetectedRadioButton);
            this.StopTestIfFaultDetectedGroupBox.Controls.Add(this.StopTestIfFaultDetectedRadioButton);
            this.StopTestIfFaultDetectedGroupBox.Location = new System.Drawing.Point(9, 410);
            this.StopTestIfFaultDetectedGroupBox.Name = "StopTestIfFaultDetectedGroupBox";
            this.StopTestIfFaultDetectedGroupBox.Size = new System.Drawing.Size(230, 60);
            this.StopTestIfFaultDetectedGroupBox.TabIndex = 16;
            this.StopTestIfFaultDetectedGroupBox.TabStop = false;
            this.StopTestIfFaultDetectedGroupBox.Text = "Stop Test If Fault Detected";
            // 
            // DontStopTestIfFaultDetectedRadioButton
            // 
            this.DontStopTestIfFaultDetectedRadioButton.AutoSize = true;
            this.DontStopTestIfFaultDetectedRadioButton.Location = new System.Drawing.Point(6, 41);
            this.DontStopTestIfFaultDetectedRadioButton.Name = "DontStopTestIfFaultDetectedRadioButton";
            this.DontStopTestIfFaultDetectedRadioButton.Size = new System.Drawing.Size(39, 17);
            this.DontStopTestIfFaultDetectedRadioButton.TabIndex = 15;
            this.DontStopTestIfFaultDetectedRadioButton.Text = "No";
            this.DontStopTestIfFaultDetectedRadioButton.UseVisualStyleBackColor = true;
            // 
            // StopTestIfFaultDetectedRadioButton
            // 
            this.StopTestIfFaultDetectedRadioButton.AutoSize = true;
            this.StopTestIfFaultDetectedRadioButton.Checked = true;
            this.StopTestIfFaultDetectedRadioButton.Location = new System.Drawing.Point(6, 18);
            this.StopTestIfFaultDetectedRadioButton.Name = "StopTestIfFaultDetectedRadioButton";
            this.StopTestIfFaultDetectedRadioButton.Size = new System.Drawing.Size(43, 17);
            this.StopTestIfFaultDetectedRadioButton.TabIndex = 14;
            this.StopTestIfFaultDetectedRadioButton.TabStop = true;
            this.StopTestIfFaultDetectedRadioButton.Text = "Yes";
            this.StopTestIfFaultDetectedRadioButton.UseVisualStyleBackColor = true;
            this.StopTestIfFaultDetectedRadioButton.CheckedChanged += new System.EventHandler(this.StopTestIfFaultDetected_Changed);
            // 
            // RunAllTestVectorsButton
            // 
            this.RunAllTestVectorsButton.Enabled = false;
            this.RunAllTestVectorsButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.RunAllTestVectorsButton.Location = new System.Drawing.Point(6, 175);
            this.RunAllTestVectorsButton.Name = "RunAllTestVectorsButton";
            this.RunAllTestVectorsButton.Size = new System.Drawing.Size(230, 23);
            this.RunAllTestVectorsButton.TabIndex = 13;
            this.RunAllTestVectorsButton.Text = "Run All Test Vectors";
            this.RunAllTestVectorsButton.UseVisualStyleBackColor = true;
            this.RunAllTestVectorsButton.Click += new System.EventHandler(this.RunAllTestVectorsButton_Click);
            // 
            // StartingVectorNumberLabel
            // 
            this.StartingVectorNumberLabel.AutoSize = true;
            this.StartingVectorNumberLabel.Location = new System.Drawing.Point(6, 297);
            this.StartingVectorNumberLabel.Name = "StartingVectorNumberLabel";
            this.StartingVectorNumberLabel.Size = new System.Drawing.Size(117, 13);
            this.StartingVectorNumberLabel.TabIndex = 12;
            this.StartingVectorNumberLabel.Text = "Starting Vector Number";
            // 
            // StartingVectorNumberTextBox
            // 
            this.StartingVectorNumberTextBox.Location = new System.Drawing.Point(6, 315);
            this.StartingVectorNumberTextBox.Name = "StartingVectorNumberTextBox";
            this.StartingVectorNumberTextBox.Size = new System.Drawing.Size(230, 20);
            this.StartingVectorNumberTextBox.TabIndex = 11;
            this.StartingVectorNumberTextBox.Text = "1";
            this.StartingVectorNumberTextBox.TextChanged += new System.EventHandler(this.StartingVectorNumberTextBox_TextChanged);
            // 
            // NextTestVectorButton
            // 
            this.NextTestVectorButton.Enabled = false;
            this.NextTestVectorButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.NextTestVectorButton.Location = new System.Drawing.Point(6, 117);
            this.NextTestVectorButton.Name = "NextTestVectorButton";
            this.NextTestVectorButton.Size = new System.Drawing.Size(230, 23);
            this.NextTestVectorButton.TabIndex = 10;
            this.NextTestVectorButton.Text = "Run Next Test Vector";
            this.NextTestVectorButton.UseVisualStyleBackColor = true;
            this.NextTestVectorButton.Click += new System.EventHandler(this.NextTestVectorButton_Click);
            // 
            // StartTestButton
            // 
            this.StartTestButton.Enabled = false;
            this.StartTestButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StartTestButton.Location = new System.Drawing.Point(6, 88);
            this.StartTestButton.Name = "StartTestButton";
            this.StartTestButton.Size = new System.Drawing.Size(230, 23);
            this.StartTestButton.TabIndex = 5;
            this.StartTestButton.Text = "Start Test, Run The First Vector";
            this.StartTestButton.UseVisualStyleBackColor = true;
            this.StartTestButton.Click += new System.EventHandler(this.StartTestButton_Click);
            // 
            // SaveTestInformationInLogFileButton
            // 
            this.SaveTestInformationInLogFileButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SaveTestInformationInLogFileButton.Location = new System.Drawing.Point(6, 35);
            this.SaveTestInformationInLogFileButton.Name = "SaveTestInformationInLogFileButton";
            this.SaveTestInformationInLogFileButton.Size = new System.Drawing.Size(230, 23);
            this.SaveTestInformationInLogFileButton.TabIndex = 4;
            this.SaveTestInformationInLogFileButton.Text = "Save Test Information in Log File";
            this.SaveTestInformationInLogFileButton.UseVisualStyleBackColor = true;
            // 
            // OpenTestVectorFileButton
            // 
            this.OpenTestVectorFileButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.OpenTestVectorFileButton.Location = new System.Drawing.Point(6, 6);
            this.OpenTestVectorFileButton.Name = "OpenTestVectorFileButton";
            this.OpenTestVectorFileButton.Size = new System.Drawing.Size(230, 23);
            this.OpenTestVectorFileButton.TabIndex = 3;
            this.OpenTestVectorFileButton.Text = "Open Test Vector File";
            this.OpenTestVectorFileButton.UseVisualStyleBackColor = true;
            this.OpenTestVectorFileButton.Click += new System.EventHandler(this.OpenTestVectorFileButton_Click);
            // 
            // TesterRichTextBox
            // 
            this.TesterRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TesterRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.TesterRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TesterRichTextBox.Location = new System.Drawing.Point(258, 6);
            this.TesterRichTextBox.Name = "TesterRichTextBox";
            this.TesterRichTextBox.Size = new System.Drawing.Size(1147, 619);
            this.TesterRichTextBox.TabIndex = 2;
            this.TesterRichTextBox.Text = "";
            // 
            // PinTableTabPage
            // 
            this.PinTableTabPage.Controls.Add(this.PinTableRichTextBox);
            this.PinTableTabPage.Location = new System.Drawing.Point(4, 22);
            this.PinTableTabPage.Name = "PinTableTabPage";
            this.PinTableTabPage.Size = new System.Drawing.Size(1411, 631);
            this.PinTableTabPage.TabIndex = 3;
            this.PinTableTabPage.Text = "Pin Table";
            this.PinTableTabPage.UseVisualStyleBackColor = true;
            // 
            // PinTableRichTextBox
            // 
            this.PinTableRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PinTableRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.PinTableRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PinTableRichTextBox.Location = new System.Drawing.Point(258, 6);
            this.PinTableRichTextBox.Name = "PinTableRichTextBox";
            this.PinTableRichTextBox.Size = new System.Drawing.Size(1147, 598);
            this.PinTableRichTextBox.TabIndex = 3;
            this.PinTableRichTextBox.Text = "";
            // 
            // CommentsTabPage
            // 
            this.CommentsTabPage.Controls.Add(this.CommentsRichTextBox);
            this.CommentsTabPage.Location = new System.Drawing.Point(4, 22);
            this.CommentsTabPage.Name = "CommentsTabPage";
            this.CommentsTabPage.Size = new System.Drawing.Size(1411, 631);
            this.CommentsTabPage.TabIndex = 4;
            this.CommentsTabPage.Text = "Comments";
            this.CommentsTabPage.UseVisualStyleBackColor = true;
            // 
            // CommentsRichTextBox
            // 
            this.CommentsRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.CommentsRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.CommentsRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CommentsRichTextBox.Location = new System.Drawing.Point(258, 6);
            this.CommentsRichTextBox.Name = "CommentsRichTextBox";
            this.CommentsRichTextBox.Size = new System.Drawing.Size(1147, 598);
            this.CommentsRichTextBox.TabIndex = 3;
            this.CommentsRichTextBox.Text = "";
            // 
            // TestVectorsTabPage
            // 
            this.TestVectorsTabPage.Controls.Add(this.TestVectorsHeaderRichTextBox);
            this.TestVectorsTabPage.Controls.Add(this.TestVectorsRichTextBox);
            this.TestVectorsTabPage.Location = new System.Drawing.Point(4, 22);
            this.TestVectorsTabPage.Name = "TestVectorsTabPage";
            this.TestVectorsTabPage.Size = new System.Drawing.Size(1411, 631);
            this.TestVectorsTabPage.TabIndex = 5;
            this.TestVectorsTabPage.Text = "Test Vectors";
            this.TestVectorsTabPage.UseVisualStyleBackColor = true;
            // 
            // TestVectorsHeaderRichTextBox
            // 
            this.TestVectorsHeaderRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TestVectorsHeaderRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.TestVectorsHeaderRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TestVectorsHeaderRichTextBox.Location = new System.Drawing.Point(258, 3);
            this.TestVectorsHeaderRichTextBox.Name = "TestVectorsHeaderRichTextBox";
            this.TestVectorsHeaderRichTextBox.Size = new System.Drawing.Size(1147, 55);
            this.TestVectorsHeaderRichTextBox.TabIndex = 4;
            this.TestVectorsHeaderRichTextBox.Text = "";
            // 
            // TestVectorsRichTextBox
            // 
            this.TestVectorsRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TestVectorsRichTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.TestVectorsRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TestVectorsRichTextBox.Location = new System.Drawing.Point(258, 60);
            this.TestVectorsRichTextBox.Name = "TestVectorsRichTextBox";
            this.TestVectorsRichTextBox.Size = new System.Drawing.Size(1147, 540);
            this.TestVectorsRichTextBox.TabIndex = 3;
            this.TestVectorsRichTextBox.Text = "";
            // 
            // DiagsTabPage
            // 
            this.DiagsTabPage.Controls.Add(this.DeviceAddressNumericUpDown);
            this.DiagsTabPage.Controls.Add(this.CycleTheLEDsButton);
            this.DiagsTabPage.Controls.Add(this.DiagRichTextBox);
            this.DiagsTabPage.Controls.Add(this.HardwareAddressEnablebutton);
            this.DiagsTabPage.Controls.Add(this.ScanForFTDIDevicesbutton);
            this.DiagsTabPage.Controls.Add(this.BusSpeedTextBox);
            this.DiagsTabPage.Controls.Add(this.ReadEEPROMInFTDIDevicesbutton);
            this.DiagsTabPage.Controls.Add(this.BusSpeedlabel);
            this.DiagsTabPage.Controls.Add(this.ReadMPC23S17Registersbutton);
            this.DiagsTabPage.Controls.Add(this.GetDriverVersionsbutton);
            this.DiagsTabPage.Controls.Add(this.RegisterContentslabel);
            this.DiagsTabPage.Controls.Add(this.ScanForFtdiMpsseDevicesbutton);
            this.DiagsTabPage.Controls.Add(this.DeviceAddresslabel);
            this.DiagsTabPage.Controls.Add(this.TurnOnLEDsbutton);
            this.DiagsTabPage.Controls.Add(this.Registerlabel);
            this.DiagsTabPage.Controls.Add(this.TurnOffLEDsbutton);
            this.DiagsTabPage.Controls.Add(this.RegisterContentsTextBox);
            this.DiagsTabPage.Controls.Add(this.RegistercomboBox);
            this.DiagsTabPage.Controls.Add(this.WriteSingleMPC23S17Registerbutton);
            this.DiagsTabPage.Controls.Add(this.Read10kMPC23S17Registersbutton);
            this.DiagsTabPage.Location = new System.Drawing.Point(4, 22);
            this.DiagsTabPage.Name = "DiagsTabPage";
            this.DiagsTabPage.Padding = new System.Windows.Forms.Padding(3);
            this.DiagsTabPage.Size = new System.Drawing.Size(1411, 631);
            this.DiagsTabPage.TabIndex = 1;
            this.DiagsTabPage.Text = "Test the Tester";
            this.DiagsTabPage.UseVisualStyleBackColor = true;
            // 
            // DeviceAddressNumericUpDown
            // 
            this.DeviceAddressNumericUpDown.Hexadecimal = true;
            this.DeviceAddressNumericUpDown.Location = new System.Drawing.Point(9, 397);
            this.DeviceAddressNumericUpDown.Maximum = new decimal(new int[] {
            7,
            0,
            0,
            0});
            this.DeviceAddressNumericUpDown.Name = "DeviceAddressNumericUpDown";
            this.DeviceAddressNumericUpDown.Size = new System.Drawing.Size(104, 20);
            this.DeviceAddressNumericUpDown.TabIndex = 23;
            this.DeviceAddressNumericUpDown.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // CycleTheLEDsButton
            // 
            this.CycleTheLEDsButton.Enabled = false;
            this.CycleTheLEDsButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CycleTheLEDsButton.Location = new System.Drawing.Point(3, 180);
            this.CycleTheLEDsButton.Name = "CycleTheLEDsButton";
            this.CycleTheLEDsButton.Size = new System.Drawing.Size(230, 23);
            this.CycleTheLEDsButton.TabIndex = 22;
            this.CycleTheLEDsButton.Text = "Cycle The LEDs";
            this.CycleTheLEDsButton.UseVisualStyleBackColor = true;
            this.CycleTheLEDsButton.Click += new System.EventHandler(this.CycleTheLEDsButton_Click);
            // 
            // HelpTabPage
            // 
            this.HelpTabPage.BackColor = System.Drawing.Color.Transparent;
            this.HelpTabPage.Controls.Add(this.richTextBox1);
            this.HelpTabPage.Location = new System.Drawing.Point(4, 22);
            this.HelpTabPage.Name = "HelpTabPage";
            this.HelpTabPage.Size = new System.Drawing.Size(1411, 631);
            this.HelpTabPage.TabIndex = 2;
            this.HelpTabPage.Text = "Help";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.richTextBox1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.richTextBox1.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBox1.Location = new System.Drawing.Point(258, 6);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(1147, 598);
            this.richTextBox1.TabIndex = 2;
            this.richTextBox1.Text = resources.GetString("richTextBox1.Text");
            // 
            // FlipChipTestBackgroundWorker
            // 
            this.FlipChipTestBackgroundWorker.WorkerReportsProgress = true;
            this.FlipChipTestBackgroundWorker.WorkerSupportsCancellation = true;
            this.FlipChipTestBackgroundWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(this.RunFlipChipTest);
            this.FlipChipTestBackgroundWorker.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.FlipChipTestStatus);
            this.FlipChipTestBackgroundWorker.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.FlipChipTestCompleted);
            // 
            // Flipchip_Tester_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1443, 681);
            this.Controls.Add(this.FlipChipTesterTabControl);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Flipchip_Tester_Form";
            this.Text = "The New and Improved Warren Stearns Flipchip Tester";
            this.FlipChipTesterTabControl.ResumeLayout(false);
            this.TestingTabPage.ResumeLayout(false);
            this.TestingTabPage.PerformLayout();
            this.DisplayTestResultsGroupBox1.ResumeLayout(false);
            this.DisplayTestResultsGroupBox1.PerformLayout();
            this.ContinuousLoopGroupBox.ResumeLayout(false);
            this.ContinuousLoopGroupBox.PerformLayout();
            this.StopTestIfFaultDetectedGroupBox.ResumeLayout(false);
            this.StopTestIfFaultDetectedGroupBox.PerformLayout();
            this.PinTableTabPage.ResumeLayout(false);
            this.CommentsTabPage.ResumeLayout(false);
            this.TestVectorsTabPage.ResumeLayout(false);
            this.DiagsTabPage.ResumeLayout(false);
            this.DiagsTabPage.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DeviceAddressNumericUpDown)).EndInit();
            this.HelpTabPage.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.RichTextBox DiagRichTextBox;
        private System.Windows.Forms.Button ScanForFTDIDevicesbutton;
        private System.Windows.Forms.Button ReadEEPROMInFTDIDevicesbutton;
        private System.Windows.Forms.Button ReadMPC23S17Registersbutton;
        private System.Windows.Forms.Button GetDriverVersionsbutton;
        private System.Windows.Forms.Button ScanForFtdiMpsseDevicesbutton;
        private System.Windows.Forms.Button TurnOnLEDsbutton;
        private System.Windows.Forms.Button TurnOffLEDsbutton;
        private System.Windows.Forms.ComboBox RegistercomboBox;
        private System.Windows.Forms.Button Read10kMPC23S17Registersbutton;
        private System.Windows.Forms.Button WriteSingleMPC23S17Registerbutton;
        private System.Windows.Forms.TextBox RegisterContentsTextBox;
        private System.Windows.Forms.Label Registerlabel;
        private System.Windows.Forms.Label DeviceAddresslabel;
        private System.Windows.Forms.Label RegisterContentslabel;
        private System.Windows.Forms.TextBox BusSpeedTextBox;
        private System.Windows.Forms.Label BusSpeedlabel;
        private System.Windows.Forms.Button HardwareAddressEnablebutton;
        private System.Windows.Forms.TabControl FlipChipTesterTabControl;
        private System.Windows.Forms.TabPage TestingTabPage;
        private System.Windows.Forms.TabPage DiagsTabPage;
        private System.Windows.Forms.Button OpenTestVectorFileButton;
        private System.Windows.Forms.RichTextBox TesterRichTextBox;
        private System.Windows.Forms.Button StartTestButton;
        private System.Windows.Forms.Button SaveTestInformationInLogFileButton;
        private System.Windows.Forms.Button CycleTheLEDsButton;
        private System.Windows.Forms.NumericUpDown DeviceAddressNumericUpDown;
        private System.Windows.Forms.Button NextTestVectorButton;
        private System.Windows.Forms.Label StartingVectorNumberLabel;
        private System.Windows.Forms.TextBox StartingVectorNumberTextBox;
        private System.Windows.Forms.Button RunAllTestVectorsButton;
        private System.ComponentModel.BackgroundWorker FlipChipTestBackgroundWorker;
        private System.Windows.Forms.GroupBox StopTestIfFaultDetectedGroupBox;
        private System.Windows.Forms.RadioButton DontStopTestIfFaultDetectedRadioButton;
        private System.Windows.Forms.RadioButton StopTestIfFaultDetectedRadioButton;
        private System.Windows.Forms.Label EndingVectorNumberLabel;
        private System.Windows.Forms.TextBox EndingVectorNumberTextBox;
        private System.Windows.Forms.GroupBox ContinuousLoopGroupBox;
        private System.Windows.Forms.RadioButton DontContinuouslyLoopRadioButton;
        private System.Windows.Forms.RadioButton ContinuouslyLoopRadioButton;
        private System.Windows.Forms.TabPage HelpTabPage;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label PassCountlabel;
        private System.Windows.Forms.TextBox PassCountTextBox;
        private System.Windows.Forms.TabPage PinTableTabPage;
        private System.Windows.Forms.RichTextBox PinTableRichTextBox;
        private System.Windows.Forms.TabPage CommentsTabPage;
        private System.Windows.Forms.RichTextBox CommentsRichTextBox;
        private System.Windows.Forms.TabPage TestVectorsTabPage;
        private System.Windows.Forms.RichTextBox TestVectorsRichTextBox;
        private System.Windows.Forms.RichTextBox TestVectorsHeaderRichTextBox;
        private System.Windows.Forms.Button ContinueTestAfterStopButton;
        private System.Windows.Forms.GroupBox DisplayTestResultsGroupBox1;
        private System.Windows.Forms.RadioButton DontDisplayTestResultsRadioButton;
        private System.Windows.Forms.RadioButton DisplayTestResultsRadioButton;
    }
}

