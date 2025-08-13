using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_ViewAllAccounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewAllAccounts();
          //  showinfo();
        }
    }

    public void ViewAllAccounts()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string getRequested = "SELECT a.Acc_No, a.Status, a.Acc_ID FROM [Account] a";

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
                    lblNoActiveAccounts.Visible = true;
                }
            }
        }
    }

    public void showinfo(int accId)
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string getRequested = @"
                SELECT a.Acc_No, a.Status, a.Acc_ID, a.Type, 
                      a.Balance, u.UserName, u.mobile_number, u.[E-Mail] 
                FROM [Account] a
                INNER JOIN [User] u ON a.Acc_ID = u.User_ID where Acc_ID=@accId"; // Adjust ON clause according to your DB keys

            using (SqlCommand cmd = new SqlCommand(getRequested, conn))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    rptActiveAccounts.DataSource = reader; // You need a Repeater/GridView control for details
                    rptActiveAccounts.DataBind();
                }
                else
                {
                    // Optional: show message or label if no results
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
    protected void Card_Click(object sender, CommandEventArgs e)
    {
        int accId = Convert.ToInt32(e.CommandArgument);
        showinfo(accId); // your method to get account+user details
        pnlAccountDetails.Style["display"] = "block"; // make details visible
    }
    protected void GoToActivate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string accId = btn.CommandArgument;

        Response.Redirect($"Activate.aspx?accId={accId}");
    }

}
