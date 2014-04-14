using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Rezwanul Ferdous 824-259-246

public partial class rf_findout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //creating instance of the class file and binds to Database
        rf_findoutClass objLink = new rf_findoutClass();

        acc.DataSource = objLink.getExtlinks();
        acc.DataBind();

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}