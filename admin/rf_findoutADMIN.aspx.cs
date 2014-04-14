using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Rezwanul Ferdous - 824-259-246

public partial class Default3 : System.Web.UI.Page
{
    //creating new instance of class
    rf_findoutClass Ext = new rf_findoutClass();

    //visible panel true and false for creating new record
    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty;
    }

    //visible panel true and false for update existing record
    protected void subEdit(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;
        pnl_new.Visible = false;
    }

    //resets fields and panel on page reload
    private void _subRebind()
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        ddl_category.Text = "Medical Institution";
        txt_name.Text = string.Empty;
        txt_brief.Text = string.Empty;
        txt_link.Text = string.Empty;
        rpt_select.DataSource = Ext.getExtlinks();
        rpt_select.DataBind();
    }

    //page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Set types of category on page load for the first time      
            ddl_category.Items.Add("Medical Institution");
            ddl_category.Items.Add("Disease");
            ddl_category.Items.Add("Medical Terms");
            ddl_category.Items.Add("Medical Practices");
            ddl_category.Items.Add("Other Links");
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

    //Execute commands based on button clicked - if insert executes the insert and calls the _strMessage function, if update calls the _showUpdate function, if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(Ext.commitInsert(ddl_category.Text, txt_name.Text, txt_brief.Text, txt_link.Text), "Insert");
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

    //called by subAdmin function - makes edit panel and form visible with values from the selected row from the table
    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        rf_findoutClass Ext = new rf_findoutClass(); 
        rpt_edit.DataSource = Ext.getExtlinkByID(id);
        rpt_edit.DataBind();
    }

    //controls required panel visibility
    private void _panelControl(Panel pnl)
    {
        pnl_edit.Visible = false;
        pnl_new.Visible = false;
        pnl.Visible = true;
    }

    //called in edit panel and form - case update commits update and calls _strMessage function, delete deletes record and calls _strMessage. cancel calls reset
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtCategory = (TextBox)e.Item.FindControl("txt_categoryE");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtBrief = (TextBox)e.Item.FindControl("txt_briefE");
                TextBox txtLink = (TextBox)e.Item.FindControl("txt_linkE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int extID = int.Parse(hdfID.Value.ToString());
                _strMessage(Ext.commitUpdate(extID, txtCategory.Text, txtName.Text, txtBrief.Text, txtLink.Text), "Update");
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