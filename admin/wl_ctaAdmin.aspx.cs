using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_wl_ctaAdmin : System.Web.UI.Page
{
    cmspageClass objPage = new cmspageClass();

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

    }

    protected void rpt_cta_DataBinding(object sender, EventArgs e)
    {

    }
    protected void rpt_cta_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //ctaClass objCTA = new ctaClass();
        //DropDownList listitems = e.Item.FindControl("ddl_cta") as DropDownList;
        //listitems.DataSource = objCTA.getCtas();
        //listitems.DataTextField = "cta_title";
        //listitems.DataValueField = "cta_id";
        //listitems.DataBind();
    }
}
