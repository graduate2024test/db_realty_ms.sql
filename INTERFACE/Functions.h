#pragma once

using namespace System;
using namespace System::ComponentModel;
using namespace System::Collections;
using namespace System::Windows::Forms;
using namespace System::Data;
using namespace System::Drawing;
using namespace Data;
using namespace Data::SqlClient;

ref class Functions
{

public:
	Functions();

	SqlConnection^ conn;
	SqlConnectionStringBuilder^ connStringBuilder;

	void ConnectToDB() {

		//Data Source=DESKTOP-4PDNSUC\SQLEXPRESS;Initial Catalog=sam;Integrated Security=True

		connStringBuilder = gcnew SqlConnectionStringBuilder();
		connStringBuilder->DataSource = "DESKTOP-4PDNSUC\SQLEXPRESS";
		connStringBuilder->InitialCatalog = "sam";
		connStringBuilder->IntegratedSecurity = true;

		conn = gcnew SqlConnection(Convert::ToString(connStringBuilder));
	}

	public: void Insert(String^ Name) {

		try
		{
			ConnectToDB();

			String^ cmdText = "INSERT Emp (name) VALUES (@nameInsertion)";
			SqlCommand^ cmd = gcnew SqlCommand(cmdText, conn);

			cmd->Parameters->AddWithValue("@nameInsertion", Name);
			conn->Open();

			cmd->ExecuteNonQuery();

		}
		finally
		{
			if (conn != nullptr)
			{
				conn->Close();
			}
		}

	}


};

