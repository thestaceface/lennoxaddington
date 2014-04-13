using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml; //imported for sitemap editing

public partial class admin_wl_crudEdit : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass(); //instance for the whole page

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

    protected void repeaterDDL(object sender, RepeaterItemEventArgs e)
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
        btn_edit.Visible = true;

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
                TextBox txtPagename = (TextBox)e.Item.FindControl("txt_pagenameE");
                TextBox txtContent = (TextBox)e.Item.FindControl("cke_contentE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int pageID = int.Parse(hdfID.Value.ToString()); 
 
                DropDownList ddlSec = (DropDownList)e.Item.FindControl("ddl_sectionE");  //this is the new secID
                int ddlSecValue = int.Parse(ddlSec.SelectedValue); //grabs the value of the dropdownlist, then parses it to integer (for new secID)             

                HiddenField hdfSecID = (HiddenField)e.Item.FindControl("hdf_secIDE"); //this is the old secID
                int secID = int.Parse(hdfSecID.Value.ToString()); //for old secID

                XmlDocument docD = new XmlDocument();
                docD.Load(Server.MapPath("../Web.sitemap"));
                XmlNodeList nlist = docD.DocumentElement.ChildNodes[0].ChildNodes[secID].ChildNodes; //second last childnodes has to be secid
                foreach (XmlNode noded in nlist)
                {
                    if (noded.Attributes["url"].Value == ("contentMain.aspx?id=" + hdfID.Value.ToString()))  //value has to equal contentMain.aspx?id= + id
                        noded.ParentNode.RemoveChild(noded);
                }

                docD.Save(Server.MapPath("../Web.sitemap"));
                
 
                _strMessage(objPage.commitUpdate(pageID, ddlSecValue, txtPagename.Text, txtContent.Text), "update");

                XmlDocument doc = new XmlDocument();
                doc.Load(Server.MapPath("../Web.sitemap"));
                XmlNode mynode = doc.CreateNode(XmlNodeType.Element, "siteMapNode", null);

                XmlAttribute urlAtt = doc.CreateAttribute("url");
                XmlAttribute titleAtt = doc.CreateAttribute("title");
                XmlAttribute descAtt = doc.CreateAttribute("description");
                XmlAttribute nsAtt = doc.CreateAttribute("xmlns");
                
                titleAtt.Value = txtPagename.Text;
                urlAtt.Value = "contentMain.aspx?id=" +pageID ;
                descAtt.Value = "";
                nsAtt.Value = "http://schemas.microsoft.com/AspNet/SiteMap-File-1.0";
                mynode.Attributes.Append(urlAtt);
                mynode.Attributes.Append(titleAtt);
                mynode.Attributes.Append(descAtt);
                mynode.Attributes.Append(nsAtt);
                int menuSection = int.Parse(ddlSec.SelectedValue);
                //int menuSection = ddlSecValue;
                XmlNode target = doc.DocumentElement.ChildNodes[0].ChildNodes[menuSection];

                target.AppendChild(mynode);
                doc.Save(Server.MapPath("../Web.sitemap"));
                pnl_edit.Visible = false;
                btn_edit.Visible = false;
                btn_return.Visible = true;
                pnl_pagelist.Visible = true;
                _subRebind();
                 Response.Redirect(Request.Url.AbsoluteUri);//this causes a refresh of the entire page... otherwise menu doesn't update until you browse to another page.
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
                //lbl_result.Text += _cp_secid.ToString();
                
                XmlDocument docDel = new XmlDocument();
                docDel.Load(Server.MapPath("../Web.sitemap"));
                XmlNodeList nlistdel = docDel.DocumentElement.ChildNodes[0].ChildNodes[_cp_secid].ChildNodes; //second last childnodes has to be secid
                foreach (XmlNode node in nlistdel)
                {
                   if (node.Attributes["url"].Value == ("contentMain.aspx?id=" + _cp_id))
                    node.ParentNode.RemoveChild(node);
                }
                docDel.Save(Server.MapPath("../Web.sitemap"));
                Response.Redirect(Request.Url.AbsoluteUri);//this causes a refresh of the entire page... otherwise menu doesn't update until you browse to another page.
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


}