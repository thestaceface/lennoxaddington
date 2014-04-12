using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_wl_ctaAdmin : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
   
    private void _subRebind()
    {
        rpt_cta.DataSource = objPage.getPages();
        rpt_cta.DataBind();        
    }

    protected void subCommand(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                //HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
                //TextBox txtCTA1 = (TextBox)e.Item.FindControl("txt_cta1");
                //TextBox txtCTA2 = (TextBox)e.Item.FindControl("txt_cta2");
                //int ctaid = int.Parse(hdfID.Value);
                //int cta1 = int.Parse(txtCTA1.Text);
                //int cta2 = int.Parse(txtCTA2.Text);
                //_strMessage(objPage.commitUpdateCTA(ctaid, cta1, cta2), "update");
                //_subRebind();
                _subUpdate(e);
                break;

        }
    }

    private void _subUpdate(RepeaterCommandEventArgs e)
    {
        HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");
        Label lblID = (Label)e.Item.FindControl("lbl_id");
        TextBox txtCTA1 = (TextBox)e.Item.FindControl("txt_cta1");
        TextBox txtCTA2 = (TextBox)e.Item.FindControl("txt_cta2");
        int lblid = int.Parse(lblID.Text);
        int ctaid = int.Parse(hdfID.Value);
        int cta1 = int.Parse(txtCTA1.Text);
        int cta2 = int.Parse(txtCTA2.Text);
        _strMessage(objPage.commitUpdateCTA(lblid, cta1, cta2), "update");
        _subRebind();
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_result.Text = "Page " + str + " was successful";
        }
        else
        {
            lbl_result.Text = "Sorry, unable to " + str + " page";
        }
    }






}
