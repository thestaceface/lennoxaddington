using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

public partial class rf_feedback : System.Web.UI.Page 
{ 
    rf_feedbackClass FB = new rf_feedbackClass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
    }

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

    protected void subEmail(object sender, EventArgs e)
    {

    }

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

    protected void sendEmail(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":
                _subRebind();
                break;

            case "Insert":
                TextBox name = (TextBox)e.Item.FindControl("txt_appName");
                TextBox email = (TextBox)e.Item.FindControl("txt_appEmail");
                TextBox msg = (TextBox)e.Item.FindControl("txt_appMsg");
                Label msg1 = (Label)e.Item.FindControl("aa");
                FileUpload file = (FileUpload)e.Item.FindControl("fileupload1");
                Label title = (Label)e.Item.FindControl("lbl_title");

                Button send = (Button)e.Item.FindControl("btn_send");
                Button back = (Button)e.Item.FindControl("btn_cancel");


                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("lacgh@ferdous.ca");
                mailMessage.To.Add("lacgh@ferdous.ca");
                mailMessage.Subject = "[Feedback : " + txt_subject.Text + "]";

                if (file.HasFile)
                {
                    mailMessage.Attachments.Add(new Attachment(file.PostedFile.InputStream, file.FileName));
                }

                mailMessage.Body = "Sender Name : " + txt_first.Text + " " + txt_last.Text + "<br />"
                    + "Sender Email " + txt_email.Text + "<br />"
                    + "Message: " + txt_message.Text;

                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtpout.secureserver.net", 80);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("lacgh@ferdous.ca", "Lennox@2014");
                smtpClient.Send(mailMessage);

                msg1.Text = "Thank you for your feedback";
                name.Enabled = false;
                email.Enabled = false;
                msg.Enabled = false;
                file.Enabled = false;
                send.Enabled = false;
                back.Text = "Feedback";

                break;


        }
    }
}