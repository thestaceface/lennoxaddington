using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


public partial class ps_thanksformADMIN : System.Web.UI.Page
{
    ps_thankmsgClass objThanks = new ps_thankmsgClass();
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
            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Update":
                _showSend(int.Parse(e.CommandArgument.ToString()));
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

            case "Send":
                TextBox to = (TextBox)e.Item.FindControl("txt_to");               
                TextBox from = (TextBox)e.Item.FindControl("txt_smEmail");
                TextBox email = (TextBox)e.Item.FindControl("txt_from");
                TextBox msg = (TextBox)e.Item.FindControl("txt_smMsg");
                Label msg1 = (Label)e.Item.FindControl("send");               
                Label title = (Label)e.Item.FindControl("lbl_to");

                Button send = (Button)e.Item.FindControl("btn_send");
                Button cancel = (Button)e.Item.FindControl("btn_cancel");


                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("puns75769@gmail.com");
                mailMessage.To.Add("puns75769@gmail.com");
                mailMessage.Subject = "[Message: Thanks Message for " + title.Text + "]";


                mailMessage.Body = "To : " + to.Text + "<br/>" + "From : " + from.Text + "<br />"
                    + "Sender Email " + email.Text + "<br />"
                    + " Message " + msg.Text;

                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("puns75769@gmail.com", "password");
                smtpClient.Send(mailMessage);
                msg1.Text = to.Text;

                msg1.Text = "Thank you";
                to.Enabled = false;
                from.Enabled = false;
                email.Enabled = false;
                msg.Enabled = false;               
                send.Enabled = false;
                cancel.Text = "All Messages";

                break;


        }
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emlU");
                TextBox txtMsg = (TextBox)e.Item.FindControl("txt_msgU");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                int id = int.Parse(hdfID.Value.ToString());
                //int id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idU")).Value);
                _strMessage(objThanks.commitUpdate(id, DateTime.Parse(txtDate.Text.ToString()), txtName.Text, txtEmail.Text, txtMsg.Text), "update");
                _subRebind();
                break;
            case "Delete":
                int _th_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idD")).Value);
                _strMessage(objThanks.commitDelete(_th_id), "message");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
    private void _showSend(int id)
    {
        _panelControl(pnl_update);
        ps_thankmsgClass _obj = new ps_thankmsgClass();
        rpt_update.DataSource = _obj.getMsgByID(id);
        rpt_update.DataBind();
    }
    private void _showDelete(int th_id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objThanks.getMsgByID(th_id);
        rpt_delete.DataBind();
    }
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }
    private void _subRebind()
    {
        rpt_all.DataSource = objThanks.getMsgs();
        rpt_all.DataBind();
        _panelControl(pnl_all);

    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = "Your" +  " " +  str + "has been deleted";

        }
        else
        {
            lbl_msg.Text = "Sorry, unable to delete your " + "str";
        }
    }
}