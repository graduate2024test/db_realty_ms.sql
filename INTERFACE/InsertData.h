#pragma once

#include "Functions.h"

namespace ifaceSQL {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// —водка дл€ InsertData
	/// </summary>
	public ref class InsertData : public System::Windows::Forms::Form
	{
	public:
		InsertData(void)
		{
			InitializeComponent();
			//
			//TODO: добавьте код конструктора
			//
		}

	protected:
		/// <summary>
		/// ќсвободить все используемые ресурсы.
		/// </summary>
		~InsertData()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::TextBox^  txtName;
	private: System::Windows::Forms::Button^  btnInsertName;

	protected:


	protected:

	private:
		/// <summary>
		/// ќб€зательна€ переменна€ конструктора.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// “ребуемый метод дл€ поддержки конструктора Ч не измен€йте 
		/// содержимое этого метода с помощью редактора кода.
		/// </summary>
		void InitializeComponent(void)
		{
			this->txtName = (gcnew System::Windows::Forms::TextBox());
			this->btnInsertName = (gcnew System::Windows::Forms::Button());
			this->SuspendLayout();
			// 
			// txtName
			// 
			this->txtName->Location = System::Drawing::Point(25, 45);
			this->txtName->Name = L"txtName";
			this->txtName->Size = System::Drawing::Size(171, 20);
			this->txtName->TabIndex = 0;
			// 
			// btnInsertName
			// 
			this->btnInsertName->Location = System::Drawing::Point(25, 96);
			this->btnInsertName->Name = L"btnInsertName";
			this->btnInsertName->Size = System::Drawing::Size(171, 23);
			this->btnInsertName->TabIndex = 1;
			this->btnInsertName->Text = L"InsertName";
			this->btnInsertName->UseVisualStyleBackColor = true;
			this->btnInsertName->Click += gcnew System::EventHandler(this, &InsertData::btnInsertName_Click);
			// 
			// InsertData
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(220, 164);
			this->Controls->Add(this->btnInsertName);
			this->Controls->Add(this->txtName);
			this->Name = L"InsertData";
			this->Text = L"InsertData";
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private: System::Void btnInsertName_Click(System::Object^  sender, System::EventArgs^  e) {

		Functions f;

		f.Insert(txtName->Text);
	}
	};
}
