using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS
{
    public partial class MasterPage2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public Label Name
        {
            get
            {
                var LblUserName = (Label)LoginView.FindControl("LblUserName");
                return LblUserName;
            }
            set
            {
                var LblUserName = (Label)LoginView.FindControl("LblUserName");
                LblUserName = value;
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}