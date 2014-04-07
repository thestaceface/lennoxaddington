using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;

public partial class wl_testpage : System.Web.UI.Page
{
    cmspageClass objCMS = new cmspageClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        ddl_main.DataSource = objCMS.getSections();
        ddl_main.DataTextField = "sp_name";
        ddl_main.DataValueField = "sp_id";
        ddl_main.DataBind();
        ddl_main.SelectedValue = "3";
        //string thing = Request.Url.AbsoluteUri;
        //string thing = Request.Url.GetLeftPart(UriPartial.Authority);
        //string thing = Request.Url.ToString();
        //string thing = Request.Url.PathAndQuery;
        //lbl.Text = thing;
    
    
    }   
}