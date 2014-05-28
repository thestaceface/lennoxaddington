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
        //gets all doctor records and binds to DB
        docacc.DataSource = objDoc.getDoctors();
        docacc.DataBind();

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}