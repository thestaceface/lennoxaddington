using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    rf_findoutClass Ext = new rf_findoutClass(); 

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty;
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
        ddl_category.Text = "Medical Institution";
        txt_name.Text = string.Empty;
        txt_link.Text = string.Empty;
        rpt_select.DataSource = Ext.getExtlinks();
        rpt_select.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Set types of category        
            ddl_category.Items.Add("Medical Institution");
            ddl_category.Items.Add("Disease");
            ddl_category.Items.Add("Medical Terms");
            ddl_category.Items.Add("Medical Practices");
            ddl_category.Items.Add("Other Links");
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
                _strMessage(Ext.commitInsert(ddl_category.Text, txt_name.Text, txt_link.Text), "Insert");
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

    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        rf_findoutClass Ext = new rf_findoutClass(); 
        rpt_edit.DataSource = Ext.getExtlinkByID(id);
        rpt_edit.DataBind();
    }

    private void _panelControl(Panel pnl)
    {
        pnl_edit.Visible = false;
        pnl_new.Visible = false;
        pnl.Visible = true;
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtCategory = (TextBox)e.Item.FindControl("txt_categoryE");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtLink = (TextBox)e.Item.FindControl("txt_linkE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int extID = int.Parse(hdfID.Value.ToString());
                _strMessage(Ext.commitUpdate(extID, txtCategory.Text, txtName.Text, txtLink.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(Ext.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}