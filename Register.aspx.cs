using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace FoodDeliveryApp
{
    public partial class Register : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Code to execute on page load
            if (Session["UserName"] != null)
            {
                Session.Clear(); // Clear session before allowing new registration
            }
        }

        // Method to check username availability
        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            string userName = txtUsername.Text.Trim();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_CheckUsernameExist", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@UserName", userName);

                    try
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            // Code to execute if there is already a user with the same username
                            lblAvailability.Text = "Username not available"; 
                            lblAvailability.CssClass = "text-danger";
                            btnRegister.Enabled = false; // Disabling Register button to prevent from registering
                        }
                        else
                        {
                            // Code to execute if there is no user with the same username
                            lblAvailability.Text = "Username available";
                            lblAvailability.CssClass = "text-success";

                            // Check if Register button is not disabled
                            if (!btnRegister.Enabled)
                            {
                                btnRegister.Enabled = true; // Re-enabling Register button
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Code to handle errors
                    }
                    finally
                    {
                        cmd.Dispose();
                        con.Close();
                        con.Dispose();
                    }
                }
            }
        }

        // Method that will execute when user click on Register button
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string userName = txtUsername.Text.Trim();
            string password = HashPassword(txtPassword.Text.Trim()); // Storing password in hashed format
            string email = txtEmail.Text.Trim();
            string role = "User"; // Or "Admin" based on the requirement

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_RegisterUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Role", role);

                    try
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Registration successful! <a href='Login'>login here.</a>";
                        lblMessage.CssClass = "text-success";
                        ResetForm();
                    }
                    catch (Exception ex)
                    {
                        // Code to handle errors
                    }
                    finally
                    {
                        cmd.Dispose();
                        con.Close();
                        con.Dispose();
                    }
                }
            }
        }

        //Method to reset form
        protected void ResetForm()
        {
            txtName.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtRepeatPassword.Text = string.Empty;
            lblAvailability.Text = string.Empty;
        }

        // Method to hash the password
        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convert the password to byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString(); // Return hashed password as a hex string
            }
        }
    }
}