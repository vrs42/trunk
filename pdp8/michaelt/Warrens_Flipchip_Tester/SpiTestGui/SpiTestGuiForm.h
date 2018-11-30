#pragma once

namespace SpiTestGui {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for SpiTestCliForm
	/// </summary>
	public ref class SpiTestGuiForm : public System::Windows::Forms::Form
	{
	public:
		SpiTestGuiForm(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~SpiTestGuiForm()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^  TestButton;
	protected:
	private: System::Windows::Forms::RichTextBox^  ConsoleRichTextBox;

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->TestButton = (gcnew System::Windows::Forms::Button());
			this->ConsoleRichTextBox = (gcnew System::Windows::Forms::RichTextBox());
			this->SuspendLayout();
			// 
			// TestButton
			// 
			this->TestButton->Location = System::Drawing::Point(12, 12);
			this->TestButton->Name = L"TestButton";
			this->TestButton->Size = System::Drawing::Size(75, 23);
			this->TestButton->TabIndex = 0;
			this->TestButton->Text = L"Test SPI";
			this->TestButton->UseVisualStyleBackColor = true;
			this->TestButton->Click += gcnew System::EventHandler(this, &SpiTestGuiForm::TestButton_Click);
			// 
			// ConsoleRichTextBox
			// 
			this->ConsoleRichTextBox->Location = System::Drawing::Point(279, 12);
			this->ConsoleRichTextBox->Name = L"ConsoleRichTextBox";
			this->ConsoleRichTextBox->Size = System::Drawing::Size(717, 706);
			this->ConsoleRichTextBox->TabIndex = 1;
			this->ConsoleRichTextBox->Text = L"";
			// 
			// SpiTestGuiForm
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(1008, 730);
			this->Controls->Add(this->ConsoleRichTextBox);
			this->Controls->Add(this->TestButton);
			this->Name = L"SpiTestGuiForm";
			this->Text = L"FTDI USB-SPI Tester";
			this->ResumeLayout(false);

		}
#pragma endregion
	private: System::Void TestButton_Click(System::Object^  sender, System::EventArgs^  e) {
		ConsoleRichTextBox->Text = "It Worked!";
	}
	};
}
