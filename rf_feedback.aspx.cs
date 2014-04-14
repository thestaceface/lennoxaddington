using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

//Rezwanul Ferdous 824-259-246

public partial class rf_feedback : System.Web.UI.Page 
{
    //creating instance of the class file
    rf_feedbackClass FB = new rf_feedbackClass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
    }
    
    //Initializing form
    private void _subRebind()
    {
        pnl_new.Visible = true;
        ddl_category.Text = "General Enquiry";
        txt_subject.Text = String.Empty;
        txt_last.Text = String.Empty;
        txt_first.Text = String.Empty;
        txt_tel.Text = String.Empty;
        txt_email.Text = String.Empty;
        txt_street.Text = String.Empty;
        txt_appt.Text = String.Empty;
        txt_city.Text = String.Empty;
        txt_province.Text = String.Empty;
        txt_country.Text = String.Empty;
        txt_message.Text = String.Empty;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Set types of category        
            ddl_category.Items.Add("General Enquiry");
            ddl_category.Items.Add("Services");
            ddl_category.Items.Add("Website");
            ddl_category.Items.Add("Complain");
            ddl_category.Items.Add("Others");
            _subRebind();
        }
    }

    //returns a message notifying user of success or failure committing changes to DB
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            msg.Text = str + " : Successful";
        }
        else
        {
            msg.Text = str + " : Failed";
        }
    }

    //Insert or ignore saving records o the database table base on users selection 
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(FB.commitInsert(ddl_category.Text, txt_subject.Text, txt_last.Text, txt_first.Text, txt_tel.Text, txt_email.Text, txt_street.Text, txt_appt.Text, txt_city.Text, txt_province.Text, txt_country.Text, txt_message.Text), "Feedback Send");              
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

}