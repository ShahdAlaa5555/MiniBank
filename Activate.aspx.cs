using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_Activate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Acc();
    }


    public void Acc()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string getRequested = "SELECT u.UserName,a.Acc_No,a.Status,a.Acc_ID FROM [Account] a INNER JOIN [User] u ON a.UID = u.UID  ";

            using (SqlCommand cmd = new SqlCommand(getRequested, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    rptActiveAccounts.DataSource = reader;
                    rptActiveAccounts.DataBind();
                    lblNoActiveAccounts.Visible = false;
                }
                else
                {
                    rptActiveAccounts.DataSource = null;
                    rptActiveAccounts.DataBind();
                    lblNoActiveAccounts.Text = "There are no accounts right now.";
                    lblNoActiveAccounts.Visible = true;
                }

            }
        }
    }

    public void ActivateOnClick(object sender ,EventArgs Args )
    {
        //Get the UserID from the control's CommandArgument
        int AccId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);
        UpdateStaus(1,AccId);
    }
    public void DeActivateOnClick(object sender, EventArgs Args )
    {
        //Get the UserID from the control's CommandArgument
        int AccId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);
        UpdateStaus(3, AccId);
    }


    public void UpdateStaus(int Status,int AccID)
        {
         
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string query = "UPDATE [Account] SET Status = @Status WHERE Acc_ID = @AccID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Status", Status);
                cmd.Parameters.AddWithValue("@AccID", AccID);

                cmd.ExecuteNonQuery();
            }
        }

        Acc(); // refresh list
        ShowMessage("Account Status Changed successfully!");
        }
    private void ShowMessage(string message, bool isSuccess = true)
    {
        string type = isSuccess ? "success" : "error";
        ScriptManager.RegisterStartupScript(this, GetType(), "toastMessage",
            $"showToast('{message}', '{type}');", true);
    }
}