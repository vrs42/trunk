#include "SpiTestGuiForm.h"

using namespace System;
using namespace System::Windows::Forms;

[STAThreadAttribute]
void Main(array<String^>^ args) {
	Application::EnableVisualStyles();
	Application::SetCompatibleTextRenderingDefault(false);
	SpiTestGui::SpiTestGuiForm form;
	Application::Run(%form);
}