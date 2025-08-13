using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void btnRegister_Click(object sender, EventArgs e)
    {
        string username = txtFullName.Text.Trim();
        string mobile_number = txtMobile.Text.Trim();
        string EMail = txtEmail.Text.Trim();
        string NationaID = txtNationalID.Text.Trim();
        string password = txtPassword.Text.Trim();
        string Confirmpassword = txtConfirmPassword.Text.Trim();

        if (!string.IsNullOrEmpty(username))
        {
            if (!string.IsNullOrEmpty(NationaID))
            {
                if (!string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(Confirmpassword))
                {
                    if (Confirmpassword == password)
                    {
                        string connectionString = "Data Source=SHAHD\\SQLEXPRESS;Initial Catalog=MiniBank;Integrated Security=True";

                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            conn.Open();
                            // ✅ Check if National ID already exists
                            string checkQuery = "SELECT COUNT(*) FROM [User] WHERE LTRIM(RTRIM(NationalID)) = LTRIM(RTRIM(@NationalID))";

                            using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                            {
                                checkCmd.Parameters.AddWithValue("@NationalID", NationaID.Trim());

                                int existingCount = Convert.ToInt32(checkCmd.ExecuteScalar());

                                if (existingCount > 0)
                                {
                                    ShowMessage("User already exists with this National ID.");
                                    return;
                                }




                            }

                            // Insert new user
                            string query = $"INSERT INTO [User]([Name],mobile_number,NationalID,[E-Mail],[Password],Status,Role) " +
                                               $"VALUES (@Name, @MobileNumber, @NationalID, @Email, @Password,3,2);";//3= pending need admin approval,2 client

                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Name", username);
                                cmd.Parameters.AddWithValue("@MobileNumber", mobile_number);
                                cmd.Parameters.AddWithValue("@NationalID", NationaID);
                                cmd.Parameters.AddWithValue("@Email", EMail);
                                cmd.Parameters.AddWithValue("@Password", password);

                                cmd.ExecuteNonQuery();
                            }
                        }
                        ShowMessage("Registered successfully.Approving your Account may take time :)");

                        // Redirect after 2 seconds
                        string script = "setTimeout(function(){ window.location='/Pages/login.aspx'; }, 4000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                    }

                    else
                    {
                        ShowMessage("Password didn't match");
                    }
                }
                else
                {
                    ShowMessage("Please enter  a password:)");
                    return;
                }
            }
            else
            {
                ShowMessage("Please enter your national id :)");
                return;
            }
        }
        else
        {
            ShowMessage("Please enter the username :).");
            return;
        }
    }
        private void ShowMessage(string message)
        {
           
            lblMessage.Text = message;
            pnlMessage.Visible = true;
            
        }
   
}