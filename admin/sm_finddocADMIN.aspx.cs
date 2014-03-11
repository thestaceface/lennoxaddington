using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    sm_finddocClass Doc = new sm_finddocClass();
    
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
        txt_name.Text = string.Empty;
        txt_bio.Text = string.Empty;
        txt_img.Text = string.Empty;
        rpt_edit.DataSource = Doc.getDoctors();
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
        if (flag) {
            msg.Text = str + " record: Successful";
        }
        else {
            msg.Text = str + " record: Failed";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Insert":
                _strMessage(Doc.commitInsert(txt_name.Text, txt_bio.Text, txt_img.Text), "Insert");
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
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtBio = (TextBox)e.Item.FindControl("txt_bioE");
                TextBox txtImg = (TextBox)e.Item.FindControl("txt_imgE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int docID = int.Parse(hdfID.Value.ToString());
                _strMessage(Doc.commitUpdate(docID, txtName.Text, txtBio.Text, txtImg.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(Doc.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}