using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sm_directory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sm_directoryClass objDir = new sm_directoryClass();

        //getting all contact records and binding to DB
        diracc.DataSource = objDir.getOffices();
        diracc.DataBind();

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}