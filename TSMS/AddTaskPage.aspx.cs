using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TSMS.Model;


namespace TSMS
{
    public partial class AddTaskPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //For displaying logged in user name on a label
            try
            {
                ((MasterPage2)this.Master).Name.Text = Session["UserName"].ToString();
            }
            catch(Exception ex)
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
              if (string.IsNullOrEmpty(lblname.Text))
                {
                    LblNameValidation.Text = "Task Name Cant be empty";
                }
                else
                {
                    TSMSEntities2 context = new TSMSEntities2();
                    TaskTable t = new TaskTable();
                    t.TaskName = txtname.Text;
                    t.StartDate =Convert.ToDateTime( txtSDate.Text);
                    t.EndDate = Convert.ToDateTime(txtEDate.Text);
                    t.EstimatedHours = Convert.ToDecimal(txtEHours.Text);
                    t.UserId = Convert.ToInt32(Session["UserId"]);
                    context.TaskTables.Add(t);
                    context.SaveChanges();
                    Response.Redirect("HomePage.aspx");
                }
            
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}