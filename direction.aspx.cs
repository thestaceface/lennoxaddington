using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    // link to class file
    directionClass objLinq = new directionClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getdirection();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl.Visible = true;
    }
}