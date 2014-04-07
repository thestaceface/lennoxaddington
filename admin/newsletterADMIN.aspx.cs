using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsletterADMIN : System.Web.UI.Page
{
    newsclass N = new newsclass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty;
    }

    protected void subEdit(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;
        pnl_new.Visible = false;
    }

    private void _subRebind()
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        txt_subject.Text = String.Empty;
        txt_last.Text = String.Empty;
        txt_first.Text = String.Empty;
        txt_email.Text = String.Empty;
        txt_message.Text = String.Empty;
        rpt_select.DataSource = N.getFeedbacks();
        rpt_select.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            msg.Text = str + " record: Successful";
        }
        else
        {
            msg.Text = str + " record: Failed";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(N.commitInsert(txt_subject.Text, txt_last.Text, txt_first.Text, txt_email.Text, txt_message.Text), "Insert");
                _subRebind();
                break;
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));

                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        newsclass FB = new newsclass();
        rpt_edit.DataSource = FB.getnewsletterByID(id);
        rpt_edit.DataBind();
    }

    private void _panelControl(Panel pnl)
    {
        pnl_edit.Visible = false;
        pnl_new.Visible = false;
        pnl.Visible = true;
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtSubject = (TextBox)e.Item.FindControl("txt_subjectE");
                TextBox txtLast = (TextBox)e.Item.FindControl("txt_LastE");
                TextBox txtFirst = (TextBox)e.Item.FindControl("txt_firstE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtMessage = (TextBox)e.Item.FindControl("txt_messageE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int FBID = int.Parse(hdfID.Value.ToString());
                _strMessage(N.commitUpdate(FBID, txtSubject.Text, txtLast.Text, txtFirst.Text, txtEmail.Text, txtMessage.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(N.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}
