using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ps_thanksform : System.Web.UI.Page
{
    ps_thankmsgClass objThanks = new ps_thankmsgClass();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            _subRebind();
        }
        

    }

    private void _subRebind()
    {
        ce.StartDate = DateTime.Now;    
        txt_date.Text = string.Empty;
        txt_name.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_staff.Text = string.Empty;
        txt_thanksmsg.Text = string.Empty;
        lbl_msg.Text = string.Empty;
        ddl_department.DataSource = objThanks.getDepartment();
        ddl_department.DataTextField = "dp_name";
        ddl_department.DataValueField = "dp_id";
        ddl_department.DataBind();
        
    }


   
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objThanks.commitInsert(DateTime.Parse(txt_date.Text.ToString()), txt_name.Text, txt_email.Text, ddl_department.Text, txt_staff.Text, txt_thanksmsg.Text), "message");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = "Your" + str + "has been sent";
           
        }
        else
        {
            lbl_msg.Text = "Sorry, unable to send your " + "str";
        }
    }
}