using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ps_appointment : System.Web.UI.Page
{
    //creating instance of the class file
    ps_appointmentClass objAppmnt = new ps_appointmentClass();

    //calls page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    //resets fields on page reload
    private void _subRebind()
    {
        ce.StartDate = DateTime.Now;
        txt_date.Text = string.Empty;
        txt_name.Text = string.Empty;
        txt_cardno.Text = string.Empty;                
        txt_date.Text = string.Empty;       
        ddl_time.Text = string.Empty;
        txt_reason.Text = string.Empty;
        ddl_dept.ClearSelection();
        ddl_dept.DataSource = objAppmnt.getDepartment();
        ddl_dept.DataTextField = "dp_name";
        ddl_dept.DataValueField = "dp_id";
        ddl_dept.DataBind();
        //ddl_dept.Items.Insert(0, String.Empty);
        //ddl_doc.ClearSelection();
        ddl_doc.DataSource = objAppmnt.getDoctors();
        ddl_doc.DataTextField = "doc_name";
        ddl_doc.DataValueField = "doc_id";
        ddl_doc.DataBind();
      
    }

    //onclick event checking to see if that appointment already exists. 
    protected void subSubmit(object sender, EventArgs e)
    {
        IQueryable<appointment> obj = objAppmnt.getBookedAppointments(txt_date.Text, ddl_time.SelectedItem.Text);
        if (obj.Count() > 0)
        { 
            lbl_msg.Text = "Please select another time slot.This time slot has already been taken."; 
        }
        else
        {
            _strMessage(objAppmnt.commitInsert(txt_name.Text, txt_cardno.Text.ToString(), ddl_dept.SelectedItem.Text, ddl_doc.SelectedItem.Text, txt_date.Text, ddl_time.SelectedItem.Text, txt_reason.Text), "appointment");
            lbl_msg.Text = "Your appointment has been booked.";
        }
   
    }
  


    //returns a message notifying user of success or failure committing changes to DB 
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = "Your" + " " + str + " " + "has been booked";

        }        
    }

     
}