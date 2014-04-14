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
        newsletter nl = new newsletter();
        if (!IsValid)
        {
            return;
        }
        else
        {
            nl.email = emailTB.Text;
            //nl.subscribe = false;
            //nl.UpdateSubscribers();
            successPH.Visible = true;
            formPH.Visible = false;
        }
    }
}
