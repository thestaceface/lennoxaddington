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

        acc.DataSource = objDir.getOffices();
        acc.DataBind();

        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}