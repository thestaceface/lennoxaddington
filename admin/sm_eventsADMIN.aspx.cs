﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    sm_eventClass Ev = new sm_eventClass();

    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
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
        txt_title.Text = string.Empty;
        txt_date.Text = string.Empty;
        txt_desc.Text = string.Empty;
        txt_img.Text = string.Empty;
        rpt_edit.DataSource = Ev.getEvents();
        rpt_edit.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
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
                _strMessage(Ev.commitInsert(txt_title.Text, DateTime.Parse(txt_date.Text.ToString()), txt_desc.Text, txt_img.Text), "Insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_bioE");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descE");
                TextBox txtImg = (TextBox)e.Item.FindControl("txt_imgE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int evID = int.Parse(hdfID.Value.ToString());
                _strMessage(Ev.commitUpdate(evID, txtTitle.Text, DateTime.Parse(txtDate.Text.ToString()), txtDesc.Text, txtImg.Text), "Update");
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