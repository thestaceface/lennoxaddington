using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unsubscribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void unsubscribe_Click(object sender, EventArgs e)
    {
        Newsletter nl = new Newsletter();
        if (!IsValid)
        {
            return;
        }
        else
        {
            nl.Email = emailTB.Text;
            nl.Subscribe = false;
            nl.UpdateSubscribers();
            successPH.Visible = true;
            formPH.Visible = false;
        }
    }
}
