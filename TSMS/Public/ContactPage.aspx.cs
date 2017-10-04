using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS.Public
{
    public partial class ContactPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendMail()
        {   
            //For Sending User Suggesions to TSMS Application
            var smtp = new System.Net.Mail.SmtpClient();
            {
                // Gmail Address from where you send the mail
                var fromAddress = "timesheetmgmt72@gmail.com";
                // address where the email will be sending
                var toAddress = "timesheetmgmt72@gmail.com";
                //Password of your gmail address
                const string fromPassword = "tsmspassword";
                // Passing the values and make a email formate to display
                string subject = YourSubject.Text.ToString();
                string body = "From: " + YourName.Text + "\n";
                body += "Email: " + YourEmail.Text + "\n";
                body += "Subject: " + YourSubject.Text + "\n";
                body += "Comments: \n" + Comments.Text + "\n";
               
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
            //For Acknowleging the user
            var smtp1 = new System.Net.Mail.SmtpClient();
            {
                // Gmail Address from where you send the mail
                var fromAddress = "timesheetmgmt72@gmail.com";
                // any address where the email will be sending
                var toAddress = YourEmail.Text.ToString();
                //Password of your gmail address
                const string fromPassword = "tsmspassword";
                // Passing the values and make a email formate to display
                string subject = "TSMS";
                string body = "Haii " + YourName.Text + "\n";
                body += "your suggesions has been taken...thanks for your support" + "\n";
                // smtp settings

                smtp1.Host = "smtp.gmail.com";
                smtp1.Port = 587;
                smtp1.EnableSsl = true;
                smtp1.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp1.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp1.Timeout = 20000;
                // Passing values to smtp object
                smtp1.Send(fromAddress, toAddress, subject, body);
            }



        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                //here on button click what will done 
                SendMail();
                DisplayMessage.Text = "Mail has been sent.Thanks for Supporting...";
                DisplayMessage.Visible = true;
                YourSubject.Text = "";
                YourEmail.Text = "";
                YourName.Text = "";
                Comments.Text = "";
            }
            catch (Exception ex)
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }

        
    }
}