using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Xml;

public partial class admin_wl_sitemapAdmin : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();

    //TreeNode firstnode;
    //TreeNode secondnode;

    protected void Page_Load(object sender, EventArgs e)
    {
        subRebind();
    }


    protected void subRebind()
    {
        XElement ele = XElement.Load(Server.MapPath("~/web.sitemap"));
        var urlCount = ele.Descendants().Attributes()
           .Where(x => x.Name == "title")
           .Select(x => x.Value).Count();

        lbl_test.Text = urlCount.ToString();
        
    }

    protected void subSelect(object sender, EventArgs e)
    {
        int countthis = 0;
        foreach (TreeNode node in TreeView1.CheckedNodes)
        {
            countthis += 1;
            if (countthis == 1)
            {
                node.Selected = true;
                btn_bottom.Enabled = true;
                btn_top.Enabled = true;
                lbl_output.Text = "";
            }
            else if (countthis == null)
            {
                lbl_output.Text = "Please select the page you wish to move";
            }
            else
            {
                lbl_output.Text = "Please select one page only";
                foreach (TreeNode node2 in TreeView1.CheckedNodes)
                {
                    node2.Selected = false;
                }
                btn_bottom.Enabled = false;
                btn_top.Enabled = false;
            }
        }
    }

    protected void moveToBottom(object sender, EventArgs e)
    {
        TreeNode selnode = TreeView1.SelectedNode;
        XmlDocument doc = new XmlDocument(); //new xml document object
        doc.Load(Server.MapPath("../Web.sitemap")); //doc now represents the sitemap.
        XmlNode mynode = doc.SelectSingleNode("//*[@title='" + selnode.Text +"']");//this grabs the node that has Home as a title. .. using xpath

        //XmlNode target = doc.SelectSingleNode("//*[@title='Donate']");//this grabs the node that has Donate as a title. .. using xpath
        XmlNode down = mynode.NextSibling; //this would grab mynode's immediate next sibling.  
        
        //target.AppendChild(mynode);
        down.ParentNode.AppendChild(mynode);
        doc.Save(Server.MapPath("../Web.sitemap"));
        Response.Redirect(Request.Url.AbsoluteUri);//this causes a refresh of the entire page... otherwise menu doesn't update until you browse to another page.
    }
    protected void moveToTop(object sender, EventArgs e)
    {
        TreeNode selnode = TreeView1.SelectedNode;
        XmlDocument doc = new XmlDocument(); //new xml document object
        doc.Load(Server.MapPath("../Web.sitemap")); //doc now represents the sitemap.
        XmlNode mynode = doc.SelectSingleNode("//*[@title='" + selnode.Text + "']");//this grabs the node that has Home as a title. .. using xpath

        //XmlNode target = doc.SelectSingleNode("//*[@title='Donate']");//this grabs the node that has Donate as a title. .. using xpath
        XmlNode down = mynode.NextSibling; //this would grab mynode's immediate next sibling.  

        //target.AppendChild(mynode);
        down.ParentNode.PrependChild(mynode);
        doc.Save(Server.MapPath("../Web.sitemap"));
        Response.Redirect(Request.Url.AbsoluteUri);//this causes a refresh of the entire page... otherwise menu doesn't update until you browse to another page.
    }

}




    //everything below here was experimenting and learning.  could be useful for future phases





    //protected void setFirst(object sender, EventArgs e)
    //{
    //    int countthis = 0;
    //    foreach (TreeNode node in TreeView1.CheckedNodes)
    //    {
    //        countthis += 1;
    //        if (countthis == 1)
    //        {
    //            node.Selected = true;

    //        }
    //        else
    //        {
    //            lbl_output.Text = "Please select one only";
    //        }
    //    }
    //    firstnode = TreeView1.SelectedNode;
    //    lbl_output.Text += "You selected " + firstnode.Value.ToString();
    //    subRebind();
    //    firstpanel.Visible = false;
    //    secondpanel.Visible = true;
    //    btn_first.Enabled = false;
    //}


    //protected void setSecond(object sender, EventArgs e)
    //{
    //    int countthis = 0;
    //    foreach (TreeNode node in TreeView2.CheckedNodes)
    //    {
    //        countthis += 1;
    //        if (countthis == 1)
    //        {
    //            node.Selected = true;

    //        }
    //        else
    //        {
    //            lbl_output.Text = "Please select one only";
    //        }
    //    }
    //    secondnode = TreeView2.SelectedNode;
    //    lbl_output.Text += ". You then selected " + secondnode.Value.ToString();
    //    btn_second.Enabled = false;
        
    //}

    //protected void moveBottom(object sender, EventArgs e)
    //{
        //let's try to edit the attribute of a selected item
        //TreeNode sourceNode = TreeView1.SelectedNode; //sourceNode is the selected node of the tree.
        //lbl_output.Text = sourceNode.Value;//this is the value of title attribute
        //lbl_output.Text = sourceNode.DataPath;//this is the value of the url attribute

        //let's try to edit the title based off of a url first.
        //XmlDocument doc = new XmlDocument(); //new xml document object
        //doc.Load(Server.MapPath("../Web.sitemap")); //doc now represents the sitemap.
        //string testme = firstnode.Text;
        //XmlNode mynode = doc.SelectSingleNode("//*[@title='" + testme +"']");//this grabs the node that has Home as a title. .. using xpath
        
        //XmlNode target = doc.SelectSingleNode("//*[@title='Donate']");//this grabs the node that has Donate as a title. .. using xpath
        //XmlNode down = mynode.NextSibling; //this would grab mynode's immediate next sibling.  
        //target.AppendChild(mynode);
        //doc.Save(Server.MapPath("../Web.sitemap"));
        //lbl_output.Text += firstnode.Text;
        

    

    //this counts selected checkboxes.
    //protected void subCount(object sender, EventArgs e)
    //{
    //    int countthis = 0;
    //    foreach (TreeNode node in TreeView1.CheckedNodes)
    //    {
    //        countthis += 1;
    //    }
    //    lbl_output.Text = countthis.ToString();
    //}

    //this will identify exactly one checked box.
    //protected void subCount2(object sender, EventArgs e)
    //{
    //    int countthis = 0;
    //    foreach (TreeNode node in TreeView1.CheckedNodes)
    //    {
    //        countthis += 1;
    //    }
    //    if (countthis == 1)
    //    {
    //        lbl_output.Text = "there is one checked box";
    //    }
    //    else
    //    {
    //        lbl_output.Text = "hmm";
    //    }
    //}

    //protected void subSel(object sender, EventArgs e)
    //{
    //    foreach (TreeNode node in TreeView1.Nodes[0].ChildNodes[0].ChildNodes) // this selects children of sections
        //foreach (TreeNode node in TreeView1.Nodes[0].ChildNodes)  //this cn select just sections.
    //    {

    //        if (node.Text == "FAQ")
    //        {
    //            node.Selected = true;
    //        }
    //    }
    //}

    //protected void subSel2(object sender, EventArgs e)
    //{
    //    int countthis = 0;
    //    foreach (TreeNode node in TreeView1.CheckedNodes)
    //    {
    //        countthis += 1;
    //        if (countthis == 1)
    //        {
    //            node.Selected = true;
    //        }
    //        else 
    //        {
    //            lbl_output.Text = "Please select one only";
    //        }
    //    }
    //}

    //public void subDown(object sender, EventArgs E)
    //{
    //    TreeNode sourceNode = TreeView1.SelectedNode;
    //    //string urlPath = sourceNode.DataPath.ToString(); //this gets the url!!!!
    //    //string valPath = sourceNode.ValuePath.ToString(); //this gets tree .  root/about us/faq
    //    //string nodeTitle = sourceNode.Value.ToString(); //this gets the title
    //    //string nodeDepth = sourceNode.Depth.ToString();  //this gets how deeply nested the node is.  so... root is 0.  about us is 1.  faq is 2.
    //    //string nodeText = sourceNode.Text.ToString(); // also gets the title
    //    //TreeView1.Nodes.Remove(TreeView1.SelectedNode);
    //    TreeView1.SelectedNode.Parent.ChildNodes.Remove(TreeView1.SelectedNode);

        
    //    //lbl_output.Text = others;
    //    //XmlDocument doc = new XmlDocument();
    //    //doc.Load(Server.MapPath("../Web.sitemap"));
    //    //XmlNode mynode = doc.DocumentElement.SelectSingleNode("//siteMapNode[url='" + urlPath + "']");
    //    //mynode.ParentNode.RemoveChild(mynode);
    //    //lbl_output.Text = mynode.OuterXml.ToString();
    //}

    //public void subdontuse(object sender, EventArgs E)
    //{
    //    TreeNode sourceNode = TreeView1.SelectedNode;
    //    string urlPath = sourceNode.DataPath.ToString(); //this gets the url!!!!
    //    //XmlDocument doc = new XmlDocument();
    //    //doc.Load(Server.MapPath("../Web.sitemap"));


    //    //var doc = XDocument.Load(Server.MapPath("../Web.sitemap"));
    //    //var alaska = SiteMapNode.Where(e => e.Attribute("url").Value == urlPath).First();

    //    //alaska.Add(new XElement("location",new XAttribute("name", "somename")));
    //    //lbl_output.Text = "hi" + doc.FirstNode.ToString();
        
        
    //}

    //protected void subList(object sender, EventArgs e)
    //{
    //    foreach (TreeNode node in TreeView1.CheckedNodes)
    //    {
    //        string checkedValue = node.Text.ToString();
    //        lbl_output.Text += checkedValue;
    //    }
    //}

    //protected void subEditAtt(object sender, EventArgs e)
    //{
    //    //let's try to edit the attribute of a selected item
    //    TreeNode sourceNode = TreeView1.SelectedNode; //sourceNode is the selected node of the tree.
    //    //lbl_output.Text = sourceNode.Value;//this is the value of title attribute
    //    lbl_output.Text = sourceNode.DataPath;//this is the value of the url attribute

    //    //let's try to edit the title based off of a url first.
    //    XmlDocument doc = new XmlDocument(); //new xml document object
    //    doc.Load(Server.MapPath("../Web.sitemap")); //doc now represents the sitemap.
    //    XmlNode mynode = doc.SelectSingleNode("//*[@title='Home']");//this grabs the node that has Home as a title. .. using xpath
    //    XmlNode target = doc.SelectSingleNode("//*[@title='Donate']");//this grabs the node that has Donate as a title. .. using xpath
    //    XmlNode down = mynode.NextSibling; //this would grab mynode's immediate next sibling.  
    //    down.AppendChild(mynode);
    //    doc.Save(Server.MapPath("../Web.sitemap"));

    //}
