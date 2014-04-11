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

    // when page load, call subRebind
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }

    // databind repeater and make distance panel not visible
    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getdirection();
        rpt_all.DataBind();
        _panelControl(pnl_all);

        pnl_distance.Visible = false;
    }

    // panel control to make panel visible or not
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl.Visible = true;
    }

    // reset button to empty textboxes and make distance panel invisible
    protected void subReset(object sender, EventArgs e)
    {
        txtFrom.Text = string.Empty;
        txtTo.Text = string.Empty;
        pnl_distance.Visible = false;
    }

    // button to make distance panel visible
    protected void subGetDistance(object sender, EventArgs e)
    {
        pnl_distance.Visible = true;
    }
}