using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sm_directoryADMIN : System.Web.UI.Page
{
    sm_directoryClass Dir = new sm_directoryClass();

    //makes visible panel for creating new record
    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty;
    }

    //resets fields on page reload
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
        rpt_select.DataSource = Dir.getOffices();
        rpt_select.DataBind();
    }

    //calls page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    //returns a message notifying user of success or failure committing changes to DB
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

    //handles button commands - if insert executes the insert and calls the _strMessage function, if update calls the _showUpdate function, if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(Dir.commitInsert(txt_title.Text, txt_type.Text, txt_name.Text, txt_tel.Text, txt_fax.Text, txt_email.Text, txt_loc.Text), "Insert");
                _subRebind();
                break;
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    //called by subAdmin - makes edit panel and form visible
    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        sm_directoryClass Dir = new sm_directoryClass();
        rpt_edit.DataSource = Dir.getOfficesByID(id);
        rpt_edit.DataBind();
    }

    //controls panel visibility
    private void _panelControl(Panel pnl)
    {
        _panelControl(pnl_new);
        pnl.Visible = true;
    }

    //called in update form - case update commits update and calls _strMessage function, delete deletes record and calls _strMessage. cancel calls reset
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