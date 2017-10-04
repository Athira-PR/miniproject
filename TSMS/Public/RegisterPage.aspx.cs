using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS.Public
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int userId = 0;
            //establishing sql connection
            SqlConnection con = new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True");
            using (SqlCommand cmd = new SqlCommand("Insert_User"))
            {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", txtName.Text.Trim());
                    string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                    cmd.Parameters.AddWithValue("@Password", Encryptedpass);
                    cmd.Parameters.AddWithValue("@Email", txtMail.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());//returns single value from database
                    con.Close();
             }
            
            switch (userId)
            {
                case -1:
                    LblValidation.Text= "Username already exists.Please choose a different username.";
                    break;
                case -2:
                    LblValidation.Text = "Supplied email address has already been used.";
                    break;
                default:

                    LblSuccess1.Text = "Registration successfull";
                    LblSucess2.Text = "Sign in to continue....";

                    break;
            }
          
        }
    
    }
}