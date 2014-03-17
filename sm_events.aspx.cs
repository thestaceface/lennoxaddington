using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sm_events : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        sm_eventClass objEv = new sm_eventClass();
        acc.DataSource = objEv.getEventsByDate(DateTime.Now);
        acc.DataBind();
        
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}