using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtCode.Visible = false;
                txtPass.Visible = false;
                txtConfirmPass.Visible = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            AuthenticateUser(txtUser.Value, txtPassword.Value);
        }

        private void AuthenticateUser(string username, string password)
        {
            string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                string encryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", encryptedPass);

                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {

                    if ((int)rdr["IsLocked"] == 1)
                    {
                        lblLogin.Text = "Either Your Account is Blocked due to limited Attempts for Login or You Don't have any Account, Please Contact Administration For further queries.";
                    }
                    else
                    {

                        if ((int)rdr["Authenticated"] == 1)
                        {
                            FormsAuthentication.RedirectFromLoginPage(txtUser.Value, true);
                        }
                        else if ((int)rdr["RetryAttempts"] > 0)
                        {
                            int AttemptsLeft = 3 - (int)rdr["RetryAttempts"];
                            lblLogin.Text = "Either Invalid UserName or Password, " + AttemptsLeft + " Attempt left";
                        }

                    }






                }

            }

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spRegisterUser", con);

                cmd.CommandType = CommandType.StoredProcedure;


                string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPasswordReg.Value, "SHA1");

                cmd.Parameters.AddWithValue("@username", txtUserReg.Value);
                cmd.Parameters.AddWithValue("@pass", EncryptedPass);
                cmd.Parameters.AddWithValue("@email", txtEmail.Value);

                con.Open();

                int returnCode = (int)cmd.ExecuteScalar();

                if (returnCode == -1)
                {
                    lblSignup.Text = "This username already exist, please try another one";
                }
                else
                {
                    lblSignup.Text = "Account created successfully";
                }
            }
        }

        protected void FbButton_Click(object sender, EventArgs e)
        {

        }

        protected void txtFbUser_TextChanged(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spUserCheck", con);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@username", txtFpUser.Text);



                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();


                while (rdr.Read())
                {
                    if (rdr["UserName"].ToString() == txtFpUser.Text)
                    {

                        string Email = rdr["Email"].ToString();

                        Random random = new Random();
                        int SecurityCode = random.Next(100000, 1000000);

                        Cache["SecurityCode"] = SecurityCode;

                        MailMessage msg = new MailMessage("dronz28@outlook.com", Email);

                        StringBuilder sb = new StringBuilder();
                        sb.Append("Six Digit Generated Security Code for Reset Password is: " + Environment.NewLine);
                        sb.Append(Cache["SecurityCode"].ToString());

                        msg.Subject = "Reset Password";
                        msg.Body = sb.ToString();



                        SmtpClient smtp = new SmtpClient("smtp.office365.com", 587)
                        {
                            EnableSsl = true,
                            Credentials = new NetworkCredential("dronz28@outlook.com", "noone@1234")
                        };

                        smtp.EnableSsl = true;
                        smtp.Send(msg);

                        Label1.Text = "Security Code has been sent to User's Email";
                        txtCode.Visible = true;
                        txtFpUser.Visible = false;
                    }
                    else
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Invalid User";
                    }
                }



            }
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            if (txtCode.Text == Cache["SecurityCode"].ToString())
            {
                Label1.Text = "Valid Code";
                txtPass.Visible = true;
                txtConfirmPass.Visible = true;
                txtCode.Visible = false;
                Cache.Remove("SecurityCode");
            }
            else
            {
                Label1.Text = "Invalid Code";
            }

            
        }
    }
}