using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }  
        protected void subscribe_Click(object sender, EventArgs e)
        {
            Newsletter nl = new Newsletter();
            if (!IsValid)
            {
                return;
            }
            else{
                nl.FName = fNameTB.Text;
                nl.LName = lNameTB.Text;
                nl.Email = emailTB.Text;
                nl.Subscribe = subscribeChkBox.Checked;
                nl.InsertSubscription();
                successPH.Visible = true;
                formPH.Visible = false;
            }
        }
    }
