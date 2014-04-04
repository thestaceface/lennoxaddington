using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml; //imported for sitemap editing

public partial class admin_wl_crudEdit : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();  //on page load, bind the data to the pagelist only.  not the form.
        }
    }

    private void _subRebind()  //binds the data to the pagelist.  not the form.  
    {
        rpt_pagelist.DataSource = objPage.getAllMerge();
        rpt_pagelist.DataBind();
        
    }


    protected void repeaterDDL(object sender, RepeaterItemEventArgs e)  //on 
    {
        HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
        DropDownList listitems = e.Item.FindControl("ddl_sectionE") as DropDownList;
        HiddenField hdfSID = (HiddenField)e.Item.FindControl("hdf_secIDE");
        listitems.DataSource = objPage.getSections();
        listitems.DataTextField = "sp_name";
        listitems.DataValueField = "sp_id";
        listitems.SelectedValue = hdfSID.Value;
        listitems.DataBind();

  

    }


    protected void subSelect(object sender, CommandEventArgs e)
    {
        //_subRebind();
        int filterID = int.Parse(e.CommandArgument.ToString());
        rpt_edit.DataSource = objPage.getCPSPmerge(Convert.ToInt32(filterID));
        rpt_edit.DataBind();


        lbl_result.Text = string.Empty;

        //This is the code For Removing all style of Repeater Item

        btn_edit.Visible = true;
        
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
        pnl_pagelist.Visible = false;
        btn_edit.Visible = false;
        btn_return.Visible = false;
        pnl_edit.Visible = true;
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
                DropDownList ddlSec = (DropDownList)e.Item.FindControl("ddl_sectionE");
                int ddlSecValue = int.Parse(ddlSec.SelectedValue); //grabs the value of the dropdownlist, then parses it to integer

                int pageID = int.Parse(hdfID.Value.ToString());
                _strMessage(objPage.commitUpdate(pageID, ddlSecValue, txtName.Text, txtContent.Text), "update");
                pnl_edit.Visible = false;
                btn_edit.Visible = false;
                btn_return.Visible = true;
                pnl_pagelist.Visible = true;
                _subRebind();
                break;

            case "Delete_This":
                Int32 _cp_id = Int32.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                Int32 _cp_secid = Int32.Parse(((HiddenField)e.Item.FindControl("hdf_secIDE")).Value);
                _strMessage(objPage.commitDelete(_cp_id), "delete");
                pnl_edit.Visible = false;
                btn_edit.Visible = false;
                btn_return.Visible = true;
                pnl_pagelist.Visible = false;
                _subRebind();


                //XmlDocument doc = new XmlDocument();
                //doc.Load(Server.MapPath("../Web.sitemap"));
                //XmlNodeList nlist = doc.DocumentElement.ChildNodes[0].ChildNodes[_cp_secid].ChildNodes; //second last childnodes has to be secid
                //foreach (XmlNode node in nlist)
                //{
                //    if (node.Attributes["url"].Value == ("contentMain.aspx?id=" + _cp_id))  //value has to equal contentMain.aspx?id=  + id
                //        node.ParentNode.RemoveChild(node);
                //}
                //doc.Save(Server.MapPath("../Web.sitemap"));

                break;
            case "Cancel_This":
                _subRebind();
                pnl_edit.Visible = false;
                btn_edit.Visible = false;
                btn_return.Visible = true;
                pnl_pagelist.Visible = true;
                break;
        }
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



    //protected void rpt_edit_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{

    //}
    //protected void ddl_sectionE_DataBound(object sender, EventArgs e)
    //{
    //    DropDownList ddl = rpt_edit.FindControl("ddl_sectionE") as DropDownList;
    //    ddl.Visible = false;
    //}
}