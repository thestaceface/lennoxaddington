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
}
