using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_ViewAllTransactionaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public void ViewAllTransactions()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string getRequested = "SELECT \r\n    t.Amount,\r\n    t.Description,\r\n    t.Date_of_creation,\r\n    fromAcc.Acc_No AS FromAccNo,\r\n    toAcc.Acc_No AS ToAccNo\r\nFROM [Transaction] t\r\nLEFT JOIN [Account] fromAcc \r\n    ON fromAcc.Acc_ID = t.From_AccID\r\nLEFT JOIN [Account] toAcc \r\n    ON toAcc.Acc_ID = t.To_AccID;\r\n";

            using (SqlCommand cmd = new SqlCommand(getRequested, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    rptTransaction.DataSource = reader;
                    rptTransaction.DataBind();
                    lblNoTransaction.Visible = false;
                }
                else
                {
                    rptTransaction.DataSource = null;
                    rptTransaction.DataBind();
                    lblNoTransaction.Visible = true;
                }
            }
        }
    }

   
    private void ShowMessage(string message, bool isSuccess = true)
    {
        string type = isSuccess ? "success" : "error";
        ScriptManager.RegisterStartupScript(this, GetType(), "toastMessage",
            $"showToast('{message}', '{type}');", true);
    }
    
        

}