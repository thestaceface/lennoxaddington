using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsletterADMIN : System.Web.UI.Page
{
    newsletterclass Eobj = new newsletterclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    protected void _subRebind()
    {
        rpt_edit.DataSource = Eobj.getnewsletter();
        rpt_edit.DataBind();
        txt_fnameI.Text = "";
        txt_lnameI.Text = "";
        txt_emailI.Text = "";
    }


    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {

        lbl_msg.Text = "subUpDel";
        switch (e.CommandName)
        {
            case "Update":

                HiddenField hdfIdU = (HiddenField)e.Item.FindControl("hdf_idE");     
                TextBox txtlname = (TextBox)e.Item.FindControl("txt_lastE");
                TextBox txtfname = (TextBox)e.Item.FindControl("txt_firstE");
                TextBox txtemail = (TextBox)e.Item.FindControl("txt_emailE");
                lbl_msg.Text = Eobj.commitUpdate(Int32.Parse(hdfIdU.Value.ToString()), txtfname.Text.ToString(), txtlname.Text.ToString(), txtemail.Text.ToString());
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
            case "Delete":
                HiddenField hdfIdD = (HiddenField)e.Item.FindControl("hdf_idE");
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
        lbl_msg.Text = Eobj.commitInsert(txt_fnameI.Text.ToString(), txt_lnameI.Text.ToString(), txt_emailI.Text.ToString());
        _subRebind();
    }
}
