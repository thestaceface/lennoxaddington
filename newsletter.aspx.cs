using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class newsletter : System.Web.UI.Page
{
    protected void subscribe_Click(object sender, EventArgs e)
    {
        string fname = fNameTB.Text.ToString();
        string lname = lNameTB.Text.ToString();
        string email = emailTB.Text.ToString();

        try
        {
            MailMessage m = new MailMessage();
            m.From = new MailAddress("ybeedah@gmail.com");
            m.To.Add("misschiwawa@hotmail.com");
            m.Subject = "test";
            m.Body = "subject";

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("ybeedah@gmail.com", "password");
            client.Port = Convert.ToInt32("587");
            client.EnableSsl = true;

            client.Send(m);

        }
        catch (Exception err)
        {
            lbl_msg.Text = err.Message.ToString();
        }


    }
}
