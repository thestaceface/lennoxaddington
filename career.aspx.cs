using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

public partial class Default2 : System.Web.UI.Page
{
    // link to class file
    positionClass objLinq = new positionClass();

    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getposition();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
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

            case "Apply":
                TextBox name = (TextBox)e.Item.FindControl("txt_appName");
                TextBox email = (TextBox)e.Item.FindControl("txt_appEmail");
                TextBox msg = (TextBox)e.Item.FindControl("txt_appMsg");
                Label msg1 = (Label)e.Item.FindControl("aa");
                FileUpload file = (FileUpload)e.Item.FindControl("fileupload1");
                Label title = (Label)e.Item.FindControl("lbl_title");

                Button apply = (Button)e.Item.FindControl("btn_apply");
                Button back = (Button)e.Item.FindControl("btn_cancel");
                

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("ybeedah@gmail.com");
                mailMessage.To.Add("ybeedah@gmail.com");
                mailMessage.Subject = "[Career: Application for " + title.Text + "]";

                if (file.HasFile)
                {
                    mailMessage.Attachments.Add(new Attachment(file.PostedFile.InputStream, file.FileName));
                }

                mailMessage.Body = "Sender Name : " + name.Text + "<br />"
                    + "Sender Email " + email.Text + "<br />"
                    + " Cover Letter " + msg.Text;

                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("ybeedah@gmail.com", "password");
                smtpClient.Send(mailMessage);
                //msg1.Text = name.Text;

                msg1.Text = "Thank you for you application";
                name.Enabled = false;
                email.Enabled = false;
                msg.Enabled = false;
                file.Enabled = false;
                apply.Enabled = false;
                back.Text = "View Jobs";

                break;

                
        }
    }

    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        positionClass _linq = new positionClass();
        rpt_update.DataSource = _linq.getPositionByID(id);
        rpt_update.DataBind();
    }

    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }


    //fileUpload1.saveAs(Server.MapPath("resume\\" + fileUpload1.FileName + ".docx"));
}