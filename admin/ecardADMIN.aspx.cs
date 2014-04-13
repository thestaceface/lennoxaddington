using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ecardclass Eobj = new ecardclass(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind(); 
        }

    }

    protected void _subRebind()
    {
        rpt_edit.DataSource = Eobj.getecards();
        rpt_edit.DataBind();
        txt_emailI.Text = "";
        txt_firstI.Text = "";
        txt_lastI.Text = "";
        txt_messageI.Text = "";
        txt_subjectI.Text = ""; 
    }


    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {

        lbl_msg.Text = "subUpDel";
        switch (e.CommandName){
            case "Update":
                
                HiddenField hdfIdU = (HiddenField)e.Item.FindControl("hdf_idE");
                TextBox txtsubject = (TextBox)e.Item.FindControl("txt_subjectE");
                TextBox txtlname = (TextBox)e.Item.FindControl("txt_lastE");
                TextBox txtfname = (TextBox)e.Item.FindControl("txt_firstE");
                TextBox txtemail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtmsg = (TextBox)e.Item.FindControl("txt_messageE");
                lbl_msg.Text = Eobj.commitUpdate(Int32.Parse(hdfIdU.Value.ToString()), txtsubject.Text.ToString(), txtlname.Text.ToString(),
                    txtfname.Text.ToString(), txtemail.Text.ToString(), txtmsg.Text.ToString());
                _subRebind();
                    break;
            case "Cancel":
                 _subRebind();
                break; 
            case "Delete":
                HiddenField hdfIdD =  (HiddenField)e.Item.FindControl("hdf_idE");
                lbl_msg.Text = Eobj.commitDelete(Int32.Parse(hdfIdD.Value.ToString()));
                _subRebind(); 
                break; 
        }
      
    }

    protected void subCancel(object sender, EventArgs e)
    {
        _subRebind(); 
    }

    protected void subInsert(object sender, EventArgs e)
    {
        lbl_msg.Text = Eobj.commitInsert(txt_subjectI.Text.ToString(), txt_lastI.Text.ToString(), txt_firstI.Text.ToString(), txt_emailI.Text.ToString(), txt_messageI.Text.ToString());
        _subRebind(); 
    }
}