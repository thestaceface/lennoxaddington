using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    sm_directoryClass Dir = new sm_directoryClass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
    }

    protected void subEdit(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;
        pnl_new.Visible = false;
    }

    private void _subRebind()
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        txt_title.Text = string.Empty;
        txt_type.Text = string.Empty;
        txt_name.Text = string.Empty;
        txt_tel.Text = string.Empty;
        txt_fax.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_loc.Text = string.Empty;
        rpt_edit.DataSource = Dir.getOffices();
        rpt_edit.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            msg.Text = str + " record: Successful";
        }
        else
        {
            msg.Text = str + " record: Failed";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(Dir.commitInsert(txt_title.Text, txt_type.Text, txt_name.Text, txt_tel.Text, txt_fax.Text, txt_email.Text, txt_loc.Text), "Insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleE");
                TextBox txtType = (TextBox)e.Item.FindControl("txt_typeE");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtTel = (TextBox)e.Item.FindControl("txt_telE");
                TextBox txtFax = (TextBox)e.Item.FindControl("txt_faxE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtLoc = (TextBox)e.Item.FindControl("txt_locE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int dirID = int.Parse(hdfID.Value.ToString());
                _strMessage(Dir.commitUpdate(dirID, txtTitle.Text, txtType.Text, txtName.Text, txtTel.Text, txtFax.Text, txtEmail.Text, txtLoc.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(Dir.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}