using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_ApproveAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
       RequestedAcc();
    }

    public void RequestedAcc()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string getRequested = "SELECT * FROM [User] WHERE Status = 3";

            using (SqlCommand cmd = new SqlCommand(getRequested, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    rptPendingAccounts.DataSource = reader;
                    rptPendingAccounts.DataBind();
                    lblNoRequests.Visible = false;
                }
                else
                {
                    rptPendingAccounts.DataSource = null;
                    rptPendingAccounts.DataBind();
                    lblNoRequests.Text = "There are no requested accounts right now.";
                    lblNoRequests.Visible = true;
                }

            }
        }

    }
    public void AcceptAccount_Click(object sender, EventArgs eventArgs)
    {
        // Get the UserID from the control's CommandArgument
        int userId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string query = "UPDATE [User] SET Status = 1 WHERE UID = @UserID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.ExecuteNonQuery();
            }
        }

        RequestedAcc(); // refresh list
        ShowMessage("Account approved successfully!");
    }


    public void RejectAccount_Click(object sender, EventArgs eventArgs)
    {
        int userId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string query = "UPDATE [User] SET Status = 2 WHERE UID = @UserID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.ExecuteNonQuery();
            }
        }

        RequestedAcc(); // refresh list
        ShowMessage("Account rejected successfully!", false);
    }
    private void ShowMessage(string message, bool isSuccess = true)
    {
        string type = isSuccess ? "success" : "error";
        ScriptManager.RegisterStartupScript(this, GetType(), "toastMessage",
            $"showToast('{message}', '{type}');", true);
    }


}
