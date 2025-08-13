using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_AHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void LoadProgressBar()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        int pendingAccounts = 0;
        int totalAccounts = 0;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string pendingQuery = "SELECT COUNT(*) FROM [User] WHERE Status = 3";
            using (SqlCommand cmd = new SqlCommand(pendingQuery, conn))
            {
                pendingAccounts = (int)cmd.ExecuteScalar();
            }

            string totalQuery = "SELECT COUNT(*) FROM [User]";
            using (SqlCommand cmd = new SqlCommand(totalQuery, conn))
            {
                totalAccounts = (int)cmd.ExecuteScalar();
            }
        }

        int percentage = 0;
        if (totalAccounts > 0)
        {
            percentage = (pendingAccounts * 100) / totalAccounts;
        }

        progressBar.Style["width"] = percentage + "%";
        progressBar.InnerHtml = percentage + "%"; // Use InnerHtml for better rendering
    }




    //gpt
    private void LoadDashboardData()
    {
        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

        int totalAccounts = 0, savingCount = 0, currentCount = 0, totalUsers = 0;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Total accounts + split
            string accQuery = "SELECT COUNT(*) AS Total, " +
                              "SUM(CASE WHEN Type='Saving' THEN 1 ELSE 0 END) AS SavingCount, " +
                              "SUM(CASE WHEN Type='Current' THEN 1 ELSE 0 END) AS CurrentCount " +
                              "FROM [Account] WHERE Status='Active'";
            using (SqlCommand cmd = new SqlCommand(accQuery, conn))
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                if (rdr.Read())
                {
                    totalAccounts = rdr.GetInt32(0);
                    savingCount = rdr.IsDBNull(1) ? 0 : rdr.GetInt32(1);
                    currentCount = rdr.IsDBNull(2) ? 0 : rdr.GetInt32(2);
                }
            }

            // Total users
            string userQuery = "SELECT COUNT(*) FROM [User]";
            using (SqlCommand cmd = new SqlCommand(userQuery, conn))
            {
                totalUsers = (int)cmd.ExecuteScalar();
            }
        }

        // Bind to labels
        lblTotalAccounts.Text = totalAccounts.ToString();
        lblTotalUsers.Text = totalUsers.ToString();

        // Pass counts to JS for charts
        ScriptManager.RegisterStartupScript(this, GetType(), "renderCharts",
            $"renderCharts({savingCount}, {currentCount}, {totalUsers});", true);
    }
    protected void GoToApproveAccounts(object sender, EventArgs e)
    {
        Response.Redirect("/ApproveAccount.aspx");
    }

    protected void GoToManageAccounts(object sender, EventArgs e)
    {
        Response.Redirect("~/Activate.aspx");
    }

    protected void GoToAllAccounts(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAllAccounts.aspx");
    }

    protected void GoToTransactions(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAllTransaction.aspx");
    }

    protected void GoToLogs(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewLog.aspx");
    }


}

