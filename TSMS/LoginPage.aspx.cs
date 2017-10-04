using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TSMS
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("select * from LoginTable where UserName=@UserName and UserPassword=@UserPassword", con);
            string epass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpassword.Text, "SHA1");
            cmd.Parameters.AddWithValue("@UserName", txtname.Text);
            cmd.Parameters.AddWithValue("@UserPassword", epass);
            
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                Session["UserName"] = txtname.Text.ToString();
                Session["UserId"] = GetUserId();
                FormsAuthentication.RedirectFromLoginPage(txtname.Text.ToString(), true);
                
            }
            else
            {
                LblValidation.Text="Your username or password is incorrect";
            }
        }

        protected int GetUserId()
        {
            int id;
            //for getting the logged in userid
            using (SqlConnection con1 = new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True"))
            {
                SqlCommand cmd = new SqlCommand("spGetUserIdByUserName", con1);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@UserName", Session["UserName"].ToString());
                cmd.Parameters.Add(param);
                con1.Open();
                id = Convert.ToInt32(cmd.ExecuteScalar());
            }
            return id;
        }



    }
}