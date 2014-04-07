using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_wl_ctaAdmin : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();
    ctaClass objCTA = new ctaClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    private void _subRebind()
    {
        rpt_cta.DataSource = objPage.getPages();
        rpt_cta.DataBind();
        ddl_test.DataSource = objCTA.getCtas() ;
        //listitems.DataSource = objCTA.getCtas();
        //ddl_test.DataTextField = "cta_title";
        //ddl_test.DataValueField = "cta_id";
        //ddl_test.DataBind();
        
    }

    protected void rpt_cta_DataBinding(object sender, EventArgs e)
    {
        //DropDownList listitems = (DropDownList)FindControl("ddl_cta");
        //DropDownList listitems = FindControl("ddl_cta") as DropDownList;
        //listitems.DataSource = objCTA.getCtas();
        //listitems.DataTextField = "cta_title";
        //listitems.DataValueField = "cta_id";
        //listitems.DataBind();
    }
    protected void rpt_cta_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //DropDownList listitems = (DropDownList)e.Item.FindControl("ddl_cta");
        //DropDownList listitems = e.Item.FindControl("ddl_cta") as DropDownList;
        //listitems.DataSource = objCTA.getCtas();
        //listitems.DataTextField = "cta_title";
        //listitems.DataValueField = "cta_id";
        //listitems.DataBind();
    }
    protected void rpt_cta_Load(object sender, EventArgs e)
    {
        //DropDownList listitems = (DropDownList)FindControl("ddl_cta");
        //DropDownList listitems = FindControl("ddl_cta") as DropDownList;
        //listitems.DataSource = objCTA.getCtas();
        //listitems.DataTextField = "cta_title";
        //listitems.DataValueField = "cta_id";
        //listitems.DataBind();
    }
}
