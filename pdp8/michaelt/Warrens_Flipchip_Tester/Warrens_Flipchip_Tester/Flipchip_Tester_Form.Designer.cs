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
            this.DisplayTheCommentsButton = new System.Windows.Forms.Button();
            this.DisplayThePinTableButton = new System.Windows.Forms.Button();
            this.StartTestButton = new System.Windows.Forms.Button();
            this.SaveTestInformationInLogFileButton = new System.Windows.Forms.Button();
            this.OpenTestVectorFileButton = new System.Windows.Forms.Button();
            this.TesterRichTextBox = new System.Windows.Forms.RichTextBox();
            this.DiagsTabPage = new System.Windows.Forms.TabPage();
            this.DeviceAddressNumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.CycleTheLEDsButton = new System.Windows.Forms.Button();
            this.FlipChipTesterTabControl.SuspendLayout();
            this.TestingTabPage.SuspendLayout();
            this.DiagsTabPage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DeviceAddressNumericUpDown)).BeginInit();
            this.SuspendLayout();
            // 
            // DiagRichTextBox
            // 
            this.DiagRichTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.DiagRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DiagRichTextBox.Location = new System.Drawing.Point(242, 6);
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
            this.Read10kMPC23S17Registersbutton.Text = "Read MPC23S17 Registers 1,000x";
            this.Read10kMPC23S17Registersbutton.UseVisualStyleBackColor = true;
            this.Read10kMPC23S17Registersbutton.Click += new System.EventHandler(this.Read1kMPC23S17Registersbutton_Click);
            // 
            // WriteSingleMPC23S17Registerbutton
            // 
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
            this.BusSpeedTextBox.Text = "100000";
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
            this.FlipChipTesterTabControl.Controls.Add(this.DiagsTabPage);
            this.FlipChipTesterTabControl.Location = new System.Drawing.Point(12, 12);
            this.FlipChipTesterTabControl.Name = "FlipChipTesterTabControl";
            this.FlipChipTesterTabControl.SelectedIndex = 0;
            this.FlipChipTesterTabControl.Size = new System.Drawing.Size(1419, 636);
            this.FlipChipTesterTabControl.TabIndex = 21;
            // 
            // TestingTabPage
            // 
            this.TestingTabPage.Controls.Add(this.DisplayTheCommentsButton);
            this.TestingTabPage.Controls.Add(this.DisplayThePinTableButton);
            this.TestingTabPage.Controls.Add(this.StartTestButton);
            this.TestingTabPage.Controls.Add(this.SaveTestInformationInLogFileButton);
            this.TestingTabPage.Controls.Add(this.OpenTestVectorFileButton);
            this.TestingTabPage.Controls.Add(this.TesterRichTextBox);
            this.TestingTabPage.Location = new System.Drawing.Point(4, 22);
            this.TestingTabPage.Name = "TestingTabPage";
            this.TestingTabPage.Padding = new System.Windows.Forms.Padding(3);
            this.TestingTabPage.Size = new System.Drawing.Size(1411, 610);
            this.TestingTabPage.TabIndex = 0;
            this.TestingTabPage.Text = "FlipChip Testing";
            this.TestingTabPage.UseVisualStyleBackColor = true;
            // 
            // DisplayTheCommentsButton
            // 
            this.DisplayTheCommentsButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DisplayTheCommentsButton.Location = new System.Drawing.Point(6, 93);
            this.DisplayTheCommentsButton.Name = "DisplayTheCommentsButton";
            this.DisplayTheCommentsButton.Size = new System.Drawing.Size(230, 23);
            this.DisplayTheCommentsButton.TabIndex = 8;
            this.DisplayTheCommentsButton.Text = "Display the Comments";
            this.DisplayTheCommentsButton.UseVisualStyleBackColor = true;
            this.DisplayTheCommentsButton.Click += new System.EventHandler(this.DisplayTheCommentsButton_Click);
            // 
            // DisplayThePinTableButton
            // 
            this.DisplayThePinTableButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DisplayThePinTableButton.Location = new System.Drawing.Point(6, 64);
            this.DisplayThePinTableButton.Name = "DisplayThePinTableButton";
            this.DisplayThePinTableButton.Size = new System.Drawing.Size(230, 23);
            this.DisplayThePinTableButton.TabIndex = 7;
            this.DisplayThePinTableButton.Text = "Display the Pin Table";
            this.DisplayThePinTableButton.UseVisualStyleBackColor = true;
            this.DisplayThePinTableButton.Click += new System.EventHandler(this.DisplayThePinTableButton_Click);
            // 
            // StartTestButton
            // 
            this.StartTestButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StartTestButton.Location = new System.Drawing.Point(6, 122);
            this.StartTestButton.Name = "StartTestButton";
            this.StartTestButton.Size = new System.Drawing.Size(230, 23);
            this.StartTestButton.TabIndex = 5;
            this.StartTestButton.Text = "Start Test";
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
            this.TesterRichTextBox.Font = new System.Drawing.Font("Courier New", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TesterRichTextBox.Location = new System.Drawing.Point(261, 6);
            this.TesterRichTextBox.Name = "TesterRichTextBox";
            this.TesterRichTextBox.Size = new System.Drawing.Size(1147, 598);
            this.TesterRichTextBox.TabIndex = 2;
            this.TesterRichTextBox.Text = "";
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
            this.DiagsTabPage.Size = new System.Drawing.Size(1411, 610);
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
            this.CycleTheLEDsButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CycleTheLEDsButton.Location = new System.Drawing.Point(6, 581);
            this.CycleTheLEDsButton.Name = "CycleTheLEDsButton";
            this.CycleTheLEDsButton.Size = new System.Drawing.Size(230, 23);
            this.CycleTheLEDsButton.TabIndex = 22;
            this.CycleTheLEDsButton.Text = "Cycle The LEDs";
            this.CycleTheLEDsButton.UseVisualStyleBackColor = true;
            this.CycleTheLEDsButton.Click += new System.EventHandler(this.CycleTheLEDsButton_Click);
            // 
            // Flipchip_Tester_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1443, 660);
            this.Controls.Add(this.FlipChipTesterTabControl);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Flipchip_Tester_Form";
            this.Text = "The New and Improved Warren Stearns Flipchip Tester";
            this.FlipChipTesterTabControl.ResumeLayout(false);
            this.TestingTabPage.ResumeLayout(false);
            this.DiagsTabPage.ResumeLayout(false);
            this.DiagsTabPage.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DeviceAddressNumericUpDown)).EndInit();
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
        private System.Windows.Forms.Button DisplayThePinTableButton;
        private System.Windows.Forms.Button DisplayTheCommentsButton;
        private System.Windows.Forms.Button CycleTheLEDsButton;
        private System.Windows.Forms.NumericUpDown DeviceAddressNumericUpDown;
    }
}

