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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = SUYPC218; Initial Catalog = TSMS; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("Select * from LoginTable where UserName = @UserName", con);
            cmd.Parameters.AddWithValue("@UserName", txtname.Text.Trim());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            if(dt.Rows.Count > 0)
            {
                SqlCommand cmd1 = new SqlCommand("update LoginTable set UserPassword=@newpassword where UserName=@Username",con);
                string newpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtnewpass.Text, "SHA1");
                cmd1.Parameters.AddWithValue("@Username", txtname.Text.Trim());
                cmd1.Parameters.AddWithValue("@newpassword", newpassword);
                cmd1.ExecuteNonQuery();
                Lblmessege.ForeColor = System.Drawing.Color.Green;
                Lblmessege.Text = "Password has been reset.sign in using new password.";
            }
            else
            {
                Lblmessege.ForeColor = System.Drawing.Color.Red;
                Lblmessege.Text = "invalid user name!!!";
            }
            con.Close();
        }
    }
}