using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{
    sm_eventClass Ev = new sm_eventClass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty;
    }

    private void _subRebind()
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        txt_title.Text = string.Empty;
        txt_date.Text = string.Empty;
        txt_desc.Text = string.Empty;
        rpt_select.DataSource = Ev.getEvents();
        rpt_select.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void subUpload(object sender, EventArgs e)
    {
        if (flu_event.HasFile)
        {
            try
            {
                if (flu_event.PostedFile.ContentType == "image/jpeg")
                {
                    if (flu_event.PostedFile.ContentLength < 102400)
                    {
                        string filename = Path.GetFileName(flu_event.FileName);
                        flu_event.SaveAs(Server.MapPath("~/Images/") + filename);
                        lbl_upstatus.Text = "Upload complete";
                        lbl_filename.Text = "Images/" + filename;
                    }
                    else
                    {
                        lbl_upstatus.Text = "File must be less than 100kb";
                    }
                }
            }
            catch (Exception ex)
            {
                lbl_upstatus.Text = "File could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            msg.Text = str + " event: Successful";
        }
        else
        {
            msg.Text = str + " event: Failed";
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(Ev.commitInsert(txt_title.Text, DateTime.Parse(txt_date.Text.ToString()), txt_desc.Text, lbl_filename.Text), "Insert");
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
        sm_eventClass Ev = new sm_eventClass();
        rpt_edit.DataSource = Ev.getEventsByID(id);
        rpt_edit.DataBind();
    }

    private void _panelControl(Panel pnl)
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateE");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descE");
                Label lblFile = (Label)e.Item.FindControl("lbl_file");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int evID = int.Parse(hdfID.Value.ToString());
                _strMessage(Ev.commitUpdate(evID, txtTitle.Text, DateTime.Parse(txtDate.Text.ToString()), txtDesc.Text, lblFile.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _ev_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(Ev.commitDelete(_ev_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}