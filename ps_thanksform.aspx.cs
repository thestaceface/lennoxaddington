using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ps_thanksform : System.Web.UI.Page
{ 
    //creating an instance of the class file
    ps_thankmsgClass objThanks = new ps_thankmsgClass();

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
        txt_email.Text = string.Empty;
        //ddl_doc.Text = string.Empty;
        txt_thanksmsg.Text = string.Empty;
        //lbl_msg.Text = string.Empty;
        ddl_department.DataSource = objThanks.getDepartment();
        ddl_department.DataTextField = "dp_name";
        ddl_department.DataValueField = "dp_id";
        ddl_department.DataBind();
        ddl_doc.ClearSelection();
        ddl_doc.DataSource = objThanks.getDoctors();
        ddl_doc.DataTextField = "doc_name";
        ddl_doc.DataValueField = "doc_id";
        ddl_doc.DataBind();
        
    }

    //handles button commands - if insert, executes the insert and calls the _strMessage function, if update calls the _showUpdate function & if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objThanks.commitInsert(DateTime.Parse(txt_date.Text.ToString()), txt_name.Text, txt_email.Text, ddl_department.SelectedItem.Text, ddl_doc.SelectedItem.Text, txt_thanksmsg.Text), "message");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }
    }

    //returns a message notifying user of success or failure committing changes to DB
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = "Your" + " " + str + "has been sent";
           
        }
        else
        {
            lbl_msg.Text = "Sorry, unable to send your " + "str";
        }
    }
}