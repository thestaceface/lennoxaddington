using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ps_appointment : System.Web.UI.Page
{
    ps_appointmentClass objAppmnt = new ps_appointmentClass();
   
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
        txt_cardno.Text = string.Empty;                
        txt_date.Text = string.Empty;
        lbl_msg.Text = string.Empty;
        ddl_time.Text = string.Empty;
        txt_reason.Text = string.Empty;
        ddl_dept.ClearSelection();
        ddl_dept.DataSource = objAppmnt.getDepartment();
        ddl_dept.DataTextField = "dp_name";
        ddl_dept.DataValueField = "dp_id";
        ddl_dept.DataBind();
        ddl_doc.ClearSelection();
        ddl_doc.DataSource = objAppmnt.getDoctors();
        ddl_doc.DataTextField = "doc_name";
        ddl_doc.DataValueField = "doc_id";
        ddl_doc.DataBind();
      
    }

    protected void subSubmit(object sender, EventArgs e)
    {
        

    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objAppmnt.commitInsert(txt_name.Text, int.Parse(txt_cardno.Text.ToString()), ddl_dept.SelectedValue.ToString(), ddl_doc.SelectedValue.ToString(), DateTime.Parse(txt_date.Text.ToString()),  txt_reason.Text), "appointment");
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
            lbl_msg.Text = "Your" + str + "has been booked";

        }
        else
        {
            lbl_msg.Text = "Sorry, unable to book your " + "str";
        }
    }
}