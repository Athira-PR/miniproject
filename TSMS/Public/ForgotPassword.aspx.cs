using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string UserName = string.Empty;
            string EPassword = string.Empty;
            string Password = string.Empty;
            using (SqlConnection con = new SqlConnection("Data Source = SUYPC218; Initial Catalog = TSMS; Integrated Security = True"))
            {
                using (SqlCommand cmd = new SqlCommand("Select UserName,UserPassword from LoginTable where UserMail=@email"))
                {
                    cmd.Parameters.AddWithValue("@email",txtEmail.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            UserName = reader["UserName"].ToString();
                            EPassword = reader["UserPassword"].ToString();
                            Password= FormsAuthentication.HashPasswordForStoringInConfigFile(EPassword, "SHA1");


                        }
                    }
                    con.Close();

                }

            }
            if(!string.IsNullOrEmpty(UserName))
            {
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    // Gmail Address from where you send the mail
                    var fromAddress = "timesheetmgmt72@gmail.com";
                    // address where the email will be sending
                    var toAddress = txtEmail.Text.Trim();
                    //Password of your gmail address
                    const string fromPassword = "tsmspassword";
                    // Passing the values and make a email formate to display
                    string subject = "Password Recovery";
                    string body = "User Name: " +UserName+ "\n";
                    body += "Email: " + txtEmail.Text + "\n";
                    body += "Reset Password using:http://localhost:64835/(S(t1erno2gmfzqtgbrldb50w0l))/Public/ResetPassword.aspx " + "\n";
                    body += "Thank you...";

                    // smtp settings

                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 20000;
                    // Passing values to smtp object
                    smtp.Send(fromAddress, toAddress, subject, body);
                }
                LblMessage.ForeColor = System.Drawing.Color.Green;
                LblMessage.Text = "Reset password link has been send to your email.please check your mail...";

            }
            else
            {
                LblMessage.ForeColor = System.Drawing.Color.Red;
                LblMessage.Text = "Given Mail id Doesnot match with our records";
            }
           

        }
    }
}