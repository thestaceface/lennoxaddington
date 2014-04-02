using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wl_testpage : System.Web.UI.Page
{
    cmspageClass objCMS = new cmspageClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        ddl_main.DataSource = objCMS.getSec(3);
        ddl_main.DataTextField = "sp_name";
        ddl_main.DataValueField = "sp_id";
        ddl_main.DataBind();
    }
}