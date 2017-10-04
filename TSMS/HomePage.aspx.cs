using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSMS
{
    public partial class HomePage : System.Web.UI.Page
    {
        SqlConnection con= new SqlConnection("Data Source = SUYPC218; Initial Catalog =TSMS; Integrated Security = True");
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {   
                //displaying logged in user name in a label
                ((MasterPage2)this.Master).Name.Text = Session["UserName"].ToString();
                if (!IsPostBack)
                {
                    ShowData();
                }
            }
            catch
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }
        //ShowData method for Displaying Data in Gridview  
        protected void ShowData()
        {
            try
            {
                dt = new DataTable();
                con.Open();
                adapter = new SqlDataAdapter("Select * from TaskTable where UserId=" + Convert.ToInt32(Session["UserId"]), con);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                con.Close();
            }
            catch
            {
                Response.Redirect("ErrorPage.aspx");
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
            try
            {
                //Finding the controls from Gridview for the row which is going to update  

                Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
                TextBox TaskName = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
                TextBox StartDate = GridView1.Rows[e.RowIndex].FindControl("txt_SDate") as TextBox;
                TextBox EndDate = GridView1.Rows[e.RowIndex].FindControl("txt_EDate") as TextBox;
                TextBox EStimatedHours = GridView1.Rows[e.RowIndex].FindControl("txt_EHours") as TextBox;
                con.Open();
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update TaskTable set TaskName='" + TaskName.Text + "',StartDate='" + StartDate.Text + "' ,EndDate='" + EndDate.Text + "',EstimatedHours='" + Convert.ToDecimal(EStimatedHours.Text) + "' where TaskId=" + Convert.ToInt32(id.Text), con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                GridView1.EditIndex = -1;
                //Call ShowData method for displaying updated data  
                ShowData();
            }
            catch
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddTaskPage.aspx");
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

            Response.Redirect("LogTaskPage.aspx");
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label txtLoggedHours = GridView1.Rows[e.RowIndex].FindControl("lbl_LHours") as Label;
                Label txtEstimatedHours = GridView1.Rows[e.RowIndex].FindControl("lbl_EHours") as Label;
                Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
                if (string.IsNullOrEmpty(txtLoggedHours.Text))
                {
                    
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete FROM TaskTable where TaskId=" + Convert.ToInt32(id.Text), con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ShowData();
                }
                else
                {
                    
                    if (txtEstimatedHours.Text == txtLoggedHours.Text)
                    {
                       
                        con.Open();
                        SqlCommand cmd = new SqlCommand("delete FROM TaskTable where TaskId=" + Convert.ToInt32(id.Text), con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ShowData();
                    }
                    else
                    { 
                        Button del_btn = GridView1.Rows[e.RowIndex].FindControl("btn_Delete") as Button;
                        del_btn.Enabled = false;
                    }
                }
            }
            catch
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}