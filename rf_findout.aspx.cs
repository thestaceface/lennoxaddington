using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rf_findout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rf_findoutClass objLink = new rf_findoutClass();

        acc.DataSource = objLink.getExtlinks();
        acc.DataBind();
        if (!Page.IsPostBack)
        {
            //lbl_page.Text = "Find Out More";
        }

        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}