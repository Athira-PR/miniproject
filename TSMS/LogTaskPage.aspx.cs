using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS
{
    public partial class LogTaskPage : System.Web.UI.Page
    {
        
        //string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;  
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
        static int TaskId;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ((MasterPage2)this.Master).Name.Text = Session["UserName"].ToString();
                if (!IsPostBack)
                {
                    using (SqlConnection con = new SqlConnection("Data Source = SUYPC218; Initial Catalog = TSMS; Integrated Security = True"))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT TaskName,TaskId FROM TaskTable where UserId="+Convert.ToInt32(Session["UserId"])))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            DropDownList1.DataSource = cmd.ExecuteReader();
                            DropDownList1.DataTextField = "TaskName";
                            DropDownList1.DataValueField = "TaskId";
                            DropDownList1.DataBind();
                            con.Close();
                        }
                    }
                    DropDownList1.Items.Insert(0, new ListItem("--Select TaskName--", "0"));
                }
            }
            catch(Exception ex)
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
        //binding Task names in dropdown
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TaskId = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            ShowData();
        }
        //ShowData method for Displaying Data in Gridview  
        protected void ShowData()
        {
            try
            {
                dt = new DataTable();
                con = new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True");
                con.Open();
                adapt = new SqlDataAdapter("Select * from TaskTable where UserId= '" + Convert.ToInt32(Session["UserId"]) + "' and TaskId = '" + TaskId + "'", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                con.Close();
            }
            catch(Exception ex)
            {
                Response.Redirect("ErroPage.aspx");

            }
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
             
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
            

        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox LoggedHours = GridView1.Rows[e.RowIndex].FindControl("txt_LHours") as TextBox;


            con = new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True");
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("Update TaskTable set LoggedHours='" + Convert.ToDecimal(LoggedHours.Text) + "' where TaskId=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }
    }
}
