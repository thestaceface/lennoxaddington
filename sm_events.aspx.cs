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
        //gets events that occur on the current day or after, and binds to DB. if event date has passed, event is not shown
        sm_eventClass objEv = new sm_eventClass();
        evacc.DataSource = objEv.getEventsByDate(DateTime.Now);
        evacc.DataBind();
        
        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}