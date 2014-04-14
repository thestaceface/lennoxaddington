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
    newsletterclass Nclass = new newsletterclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }

    protected void subscribe_Click(object sender, EventArgs e)
    {
        string fname = fNameTB.Text.ToString();
        string lname = lNameTB.Text.ToString();
        string email = emailTB.Text.ToString();

        try
        {
            MailMessage m = new MailMessage();
            m.From = new MailAddress("lacghhospitalproject@gmail.com");
            m.To.Add("misschiwawa@hotmail.com");
            m.Subject = "test";
            m.Body = "subject";

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("lacghhospitalproject@gmail.com", "lacghhospitalproject1!");
            client.Port = Convert.ToInt32("587");
            client.EnableSsl = true;

            client.Send(m);
            lbl_msg.Text = Nclass.commitInsert(lname, fname, email);

        }
        catch (Exception err)
        {
            lbl_msg.Text = err.Message.ToString();
        }


    }
}










/*{ 
    newsclass E = new newsclass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
    }

    private void _subRebind()
    {
        pnl_new.Visible = true;
        lNameTB.Text = String.Empty;
        fNameTB.Text = String.Empty;
        emailTB.Text = String.Empty;
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = str + " : Successful";
        }
        else
        {
            lbl_msg.Text = str + " : Failed";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(E.commitInsert(txtSubject.Text, lNameTB.Text, fNameTB.Text, emailTB.Text, txtMessage.Text), "Ecard Send");
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
                mailMessage.From = new MailAddress("lacghhospitalproject@gmail.com");
                mailMessage.To.Add("lacghhospitalproject@gmail.com");
                mailMessage.Subject = "[Ecard : " + txtSubject.Text + "]";

                if (file.HasFile)
                {
                    mailMessage.Attachments.Add(new Attachment(file.PostedFile.InputStream, file.FileName));
                }

                mailMessage.Body = "Sender Name : " + fNameTB.Text + " " + lNameTB.Text + "<br />"
                    + "Sender Email " + emailTB.Text + "<br />"
                    + "Message: " + txtMessage.Text;

                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("lacghhospitalproject@gmail.com", "lacghhospitalproject1!");
                smtpClient.Send(mailMessage);

                msg1.Text = "Thank you to send an E-Card to a Patient";
                name.Enabled = false;
                email.Enabled = false;
                msg.Enabled = false;
                file.Enabled = false;
                send.Enabled = false;
                back.Text = "Ecard";

                break;


        }
    }
} */


//Other option 1//
/*


{
    protected void send_Click(object sender, EventArgs e)
    {
        string fname = fNameTB.Text.ToString();
        string lname = lNameTB.Text.ToString();
        string msg = txtSubject.Text.ToString();
        string header = txtMessage.Text.ToString();
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
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */
//Other option 2//
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!this.IsPostBack)
    //    {
    //        // Set color options.
    //        lstBackColor.Items.Add("White");
    //        lstBackColor.Items.Add("Red");
    //        lstBackColor.Items.Add("Green");
    //        lstBackColor.Items.Add("Blue");
    //        lstBackColor.Items.Add("Yellow");
    //        // Set font options.
    //        lstFontName.Items.Add("Times New Roman");
    //        lstFontName.Items.Add("Arial");
    //        lstFontName.Items.Add("Verdana");
    //        lstFontName.Items.Add("Tahoma");
    //        // Set border style options by adding a series of
    //        // ListItem objects.
    //        ListItem item = new ListItem();
    //        // The item text indicates the name of the option.
    //        item.Text = BorderStyle.None.ToString();
    //        // The item value records the corresponding integer
    //        // from the enumeration. To obtain this value, you
    //        // must cast the enumeration value to an integer,
    //        // and then convert the number to a string so it
    //        // can be placed in the HTML page.
    //        item.Value = ((int)BorderStyle.None).ToString();
    //        // Add the item.
    //        lstBorder.Items.Add(item);
    //        // Now repeat the process for two other border styles.
    //        item = new ListItem();
    //        item.Text = BorderStyle.Double.ToString();
    //        item.Value = ((int)BorderStyle.Double).ToString();
    //        lstBorder.Items.Add(item);
    //        item = new ListItem();
    //        item.Text = BorderStyle.Solid.ToString();
    //        item.Value = ((int)BorderStyle.Solid).ToString();
    //        lstBorder.Items.Add(item);
    //        // Select the first border option.
    //        lstBorder.SelectedIndex = 0;
    //        // Set the picture.
    //        imgDefault.ImageUrl = "defaultpic.png";
    //    }
    //}

    //protected void cmdUpdate_Click(object sender, EventArgs e)

    //{
    //    // Update the color.
    //    // --- pnlCard.BackColor = Color.FromName(lstBackColor.SelectedItem.Text);
    //    // Update the font.\
    //    lblGreeting.Font.Name = lstFontName.SelectedItem.Text;
    //    if (Int32.Parse(txtFontSize.Text) > 0)

    //    {
    //        lblGreeting.Font.Size =
    //        FontUnit.Point(Int32.Parse(txtFontSize.Text));
    //    }

    //    // Update the border style. This requires two conversion steps.
    //    // First, the value of the list item is converted from a string
    //    // into an integer. Next, the integer is converted to a value in
    //    // the BorderStyle enumeration.
    //    int borderValue = Int32.Parse(lstBorder.SelectedItem.Value);
    //    pnlCard.BorderStyle = (BorderStyle)borderValue;
    //    // Update the picture.
    //    if (chkPicture.Checked)

    //   {
    //        imgDefault.Visible = true;
    //    }

    //    else

    //    {
    //        imgDefault.Visible = false;
    //    }

    //    // Set the text.
    //    lblGreeting.Text = txtGreeting.Text;

    //}

//}
