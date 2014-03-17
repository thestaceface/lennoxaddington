using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sm_finddoc : System.Web.UI.Page
{
    sm_finddocClass objDoc = new sm_finddocClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        acc.DataSource = objDoc.getDoctors();
        acc.DataBind();

        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}