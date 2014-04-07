using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faq : System.Web.UI.Page
{
    faqclass objLinq = new faqclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        rpt_faq.DataSource = objLinq.getfaq();
        rpt_faq.DataBind();
        panelControl(rpt_faq);

        pnl_new.Visible = false;
    }


}
