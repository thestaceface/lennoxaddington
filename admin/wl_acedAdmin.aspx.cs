using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_wl_acedAdmin : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    protected void subCancel(object sender, EventArgs e)
    {
        _subRebind();
    }

    protected void subInsert(object sender, EventArgs e)
    {
        _strMessage(objPage.commitInsert(txt_pagenameI.Text, cke_contentI.Text), "insert");
        _subRebind();
    }

    private void _subRebind()
    {
        rpt_pagelist.DataSource = objPage.getPages();
        rpt_pagelist.DataBind();
        txt_pagenameI.Text = string.Empty;
        cke_contentI.Text = string.Empty;
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl.Text = "Page " + str + " was successful";
        }
        else
        {
            lbl.Text = "Sorry, unable to " + str + " page";
        }
    }

    protected void subSelect(object sender, CommandEventArgs e)
    {
        pnl_edit.Visible = false;
        pnl_insert.Visible = false;
        btn_showEdit.Visible = true;
        btn_showInsert.Visible = true;
        //_subRebind();
        int filterID = int.Parse(e.CommandArgument.ToString());
        rpt_edit.DataSource = objPage.getPageById(Convert.ToInt32(filterID));
        rpt_edit.DataBind();
        lbl.Text = string.Empty;

        //This is the code For Removing all style of Repeater Item
        foreach (RepeaterItem item in rpt_pagelist.Items)
        {

            LinkButton previous = item.FindControl("lkb_pagename") as LinkButton;

            (previous.NamingContainer.FindControl("row") as System.Web.UI.HtmlControls.HtmlContainerControl).Attributes.Remove("style");
            previous.Attributes.Remove("style");


        }
        LinkButton temp = (sender as LinkButton);
        temp.Attributes.Add("style", "color:green  !important;");
        (temp.NamingContainer.FindControl("row") as System.Web.UI.HtmlControls.HtmlContainerControl).Attributes.Add("style", "background-color:#BADFCE !important;");
        

    }

    protected void subEdit(object sender, EventArgs e)
    {
        
        pnl_edit.Visible = false;
        pnl_insert.Visible = true;
    }

    protected void subShowInsert(object sender, EventArgs e)
    {
        pnl_edit.Visible = false;
        pnl_insert.Visible = true;
    }

    protected void subShowEdit(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;
        pnl_insert.Visible = false;
    }
    protected void subAdmin(object sender, RepeaterCommandEventArgs e)
    {
        cmspageClass objPage = new cmspageClass();
        switch (e.CommandName)
        {
            case "Update_This":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_pagenameE");
                TextBox txtContent = (TextBox)e.Item.FindControl("cke_contentE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");

                
                int pageID = int.Parse(hdfID.Value.ToString());
                _strMessage(objPage.commitUpdate(pageID, txtName.Text, txtContent.Text), "update");
                pnl_edit.Visible = false;
                _subRebind();

                break;
            case "Delete_This":
                Int32 _cp_id = Int32.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);

                _strMessage(objPage.commitDelete(_cp_id), "delete");
                pnl_edit.Visible = false;
                _subRebind();
                break;
            case "Cancel_This":
                _subRebind();
                pnl_edit.Visible = false;
                break;
        }
    }
    protected void subSelect2(object sender, EventArgs e)
    {

        //This is the code For Removing all style of Repeater Item
        foreach (RepeaterItem item in rpt_pagelist.Items)
        {

            LinkButton previous = item.FindControl("lkb_pagename") as LinkButton;

            (previous.NamingContainer.FindControl("row") as System.Web.UI.HtmlControls.HtmlContainerControl).Attributes.Remove("style");
            previous.Attributes.Remove("style");


        }
        LinkButton temp = (sender as LinkButton);
        temp.Attributes.Add("style", "color:green  !important;");
        (temp.NamingContainer.FindControl("row") as System.Web.UI.HtmlControls.HtmlContainerControl).Attributes.Add("style", "background-color:#BADFCE !important;");
    }
}