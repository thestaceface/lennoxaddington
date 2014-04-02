using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class admin_wl_crudAdd : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass(); //instance of the class

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();//binds the ddl datasource
        }
    }

    private void _subRebind()
    {
        ddl_sectionI.DataSource = objPage.getSections();//gets section names from database
        ddl_sectionI.DataTextField = "sp_name";//name shows up in the ddl list
        ddl_sectionI.DataValueField = "sp_id";//id is populated as the value
        ddl_sectionI.DataBind();
        txt_pagenameI.Text = string.Empty;
        cke_contentI.Text = string.Empty;
    }

    protected void subInsert(object sender, EventArgs e)
    {
        _strMessage(objPage.commitInsert(int.Parse(ddl_sectionI.SelectedValue), txt_pagenameI.Text, cke_contentI.Text), "insert");
        //XmlDocument doc = new XmlDocument();
        //doc.Load(Server.MapPath("Web.sitemap"));

        //XmlNode mynode = doc.CreateNode(XmlNodeType.Element, "siteMapNode", null);

        //XmlAttribute urlAtt = doc.CreateAttribute("url");
        //XmlAttribute titleAtt = doc.CreateAttribute("title");
        //XmlAttribute descAtt = doc.CreateAttribute("description");
        //XmlAttribute nsAtt = doc.CreateAttribute("xmlns");

        //titleAtt.Value = txt_pagenameI.Text;
        //urlAtt.Value = "contentMain.aspx?id=" + int.Parse(ddl_sectionI.SelectedValue) ;
        //descAtt.Value = "";
        //nsAtt.Value = "http://schemas.microsoft.com/AspNet/SiteMap-File-1.0";
        //mynode.Attributes.Append(urlAtt);
        //mynode.Attributes.Append(titleAtt);
        //mynode.Attributes.Append(descAtt);
        //mynode.Attributes.Append(nsAtt);
        //XmlNode target = doc.DocumentElement.ChildNodes[0].ChildNodes[0];

        //target.AppendChild(mynode);

        //doc.Save(Server.MapPath("Web.sitemap"));
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_result.Text = "Page " + str + " was successful";
            pnl_add.Visible = false;
            pnl_addMore.Visible = true;
        }
        else
        {
            lbl_result.Text = "Sorry, unable to " + str + " page";
        }
    }

    protected void subAddMore(object sender, EventArgs e)
    {
        _subRebind();
        pnl_add.Visible = true;
        pnl_addMore.Visible = false;
        lbl_result.Text = string.Empty;
    }
}