using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contentMain : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            subShowPages();//temporary, for testing until I get a working sitemap/menu
        }

        cmspageClass objCMS = new cmspageClass();
        if (Request.QueryString.Get("id") != null)
        {
            int id = Convert.ToInt32(Request.QueryString.Get("id"));
            rpt_one.DataSource = objCMS.getPageById(id);
            rpt_one.DataBind();
        }
    }

    protected void subShowPages()//temporary, for testing until I get a working sitemap/menu
    {
        cmspageClass objCMS = new cmspageClass();
        rpt_list.DataSource = objCMS.getPages();
        rpt_list.DataBind();

    }
    protected void subSelect(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lkb_title = (LinkButton)e.Item.FindControl("lkb_title");
            contentpage Item = (contentpage)e.Item.DataItem;
            lkb_title.PostBackUrl = customizedURL(Item.cp_pagename, Item.cp_id);
        }
    }

    public static string customizedURL(string title, int id)
    {
        string strTitle = title.Trim();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace(" ", "-");//title in the url will have no spaces
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = "~/contentMain.aspx?id=" + id.ToString();
        return strTitle;
    }

}