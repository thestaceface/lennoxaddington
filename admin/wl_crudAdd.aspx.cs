using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;//imported

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
        //_strMessage(objPage.commitInsert(int.Parse(ddl_sectionI.SelectedValue), txt_pagenameI.Text, cke_contentI.Text), "insert"); //this is the old way.
        
        _strMessage2(objPage.commitAdd(int.Parse(ddl_sectionI.SelectedValue), txt_pagenameI.Text, cke_contentI.Text), "insert");
        Response.Redirect(Request.Url.AbsoluteUri);//this causes a refresh of the entire page... otherwise menu doesn't update until you browse to another page.


    }

    private void _strMessage2(int lastid, string str)//lastid is the last id added to the database.  returned using stored procedure
    {
        if (lastid > 0)
        {
            lbl_result.Text = "Page " + str + " was successful";
            pnl_add.Visible = false;
            pnl_addMore.Visible = true;
            lbl_result.Text += lastid;

            XmlDocument doc = new XmlDocument(); 
            doc.Load(Server.MapPath("../Web.sitemap"));

            XmlNode mynode = doc.CreateNode(XmlNodeType.Element, "siteMapNode", null);  //this is my new node.

            XmlAttribute urlAtt = doc.CreateAttribute("url");  //these are all the attributes i'll need
            XmlAttribute titleAtt = doc.CreateAttribute("title");
            XmlAttribute descAtt = doc.CreateAttribute("description");
            XmlAttribute nsAtt = doc.CreateAttribute("xmlns");

            titleAtt.Value = txt_pagenameI.Text; //these lines are adding the values to the attributes
            urlAtt.Value = "contentMain.aspx?id=" + lastid;
            string fullUrl = "/lennoxaddington/" + urlAtt.Value;
            objPage.addURL(lastid, fullUrl);
            descAtt.Value = "";
            nsAtt.Value = "http://schemas.microsoft.com/AspNet/SiteMap-File-1.0";
            mynode.Attributes.Append(urlAtt);  //these lines add the attributes to my node, mynode.
            mynode.Attributes.Append(titleAtt);
            mynode.Attributes.Append(descAtt);
            mynode.Attributes.Append(nsAtt);
            int menuSection = int.Parse(ddl_sectionI.SelectedValue); 
            XmlNode target = doc.DocumentElement.ChildNodes[0].ChildNodes[menuSection]; //target is where i want to place my new node.  notice menusection.  

            target.AppendChild(mynode);  //add the node!

            doc.Save(Server.MapPath("../Web.sitemap"));  
        }
        else
        {
            lbl_result.Text = "Sorry, unable to " + str + " page";
        }

    }

    //old code.  may come in handy later
    //private void _strMessage(bool flag, string str)
    //{
    //    if (flag)
    //    {
    //        lbl_result.Text = "Page " + str + " was successful";
    //        pnl_add.Visible = false;
    //        pnl_addMore.Visible = true;
    //    }
    //    else
    //    {
    //        lbl_result.Text = "Sorry, unable to " + str + " page";
    //    }
    //}

    protected void subAddMore(object sender, EventArgs e)
    {
        _subRebind();
        pnl_add.Visible = true;
        pnl_addMore.Visible = false;
        lbl_result.Text = string.Empty;
    }
}