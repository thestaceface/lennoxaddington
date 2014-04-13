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
        rpt_edit.DataSource = Eobj.getecards();
        rpt_edit.DataBind(); 
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
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
                break;
            case "Insert":
                break; 
            case "Delete":
                break; 
        }
      
    }
}