using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web.UI;

public partial class Pages_login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Do nothing on initial load
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (string.IsNullOrEmpty(username))
        {
            ShowMessage("Please enter the username.");
            return;
        }
        else if (string.IsNullOrEmpty(password))
        {
            ShowMessage("Please enter the password .");
            return;
        }

        

        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";
        string columnName = "";
       

        if (IsValidNationalId(username))
        {
           
            columnName = "NationalID";
        }
        else if (IsValidEmail(username))
        {
            columnName = "[E-Mail]";
        }
        else
        {
            ShowMessage("Invalid username format. Please enter a valid National ID .");
            return;
        }

        string query = $"SELECT * FROM [User] WHERE {columnName} = @username";

        using (SqlConnection conn = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@username", username);

            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                { 
                        string dbPassword = reader["Password"].ToString();
                    string Role = reader["Role"].ToString();





                    if (dbPassword == password)
                        {
                        if (columnName == "NationalID")

                        { int status = (int)reader["Status"];
                            if (status == 3)
                                ShowMessage("Your Account not verified by the admin yet , kindly try again later :) ");

                            else if (status == 2)
                                ShowMessage("This Account is Closed , Please Refer to the Nearest Branch");


                            else if (status == 1)//Active

                                Response.Redirect("~/UHome.aspx"); // User Home
                        }
                        else if (Role.Equals('1'))

                            {

                                Response.Redirect("~/Pages/Admin/AHome.aspx"); // Admin Home
                            }
                           else
                        {
                            ShowMessage("Invalid username format. Please enter a valid National ID .");
                            return;
                        }
                    }
                        else
                        {
                            ShowMessage("Please enter the correct password!");
                        }
                    }
                
                else 
                {
                    ShowMessage("User not found. Want to be part of our family?", "info", true);
                    
                }

            }
        }
    }

    private bool IsValidNationalId(string id)
    {
      
        return Regex.IsMatch(id, @"^\d{14}$");
    }

    private bool IsValidEmail(string email)
    {
        try
        {
            var addr = new MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }

    }
    private void ShowMessage(string message, string type = "error", bool showRegisterButton = false)
    {
        pnlMessage.CssClass = "alert " + type;
        lblMessage.Text = message;
        pnlMessage.Visible = true;
        btnGoRegister.Visible = showRegisterButton;
    }

    protected void btnGoRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Register.aspx");
    }

}
