﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
public partial class Default2 : System.Web.UI.Page
{
    //creating new instance of class
    rf_waittimeClass WT = new rf_waittimeClass();

    //visible panel true and false for creating new record
    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_edit.Visible = false;
        msg.Text = string.Empty; 
    }

    //visible panel true and false for update existing record
    protected void subEdit(object sender, EventArgs e)
    {
        pnl_edit.Visible = true;
        pnl_new.Visible = false;
    }

    //resets fields and panel on page reload
    private void _subRebind()
    {
        lbl_instuction.Text = "Note: Please Update number of Doctors on duty, Patients registered, Patients attended and Average time required per patient for calculated wait time. Update Patient registered with 0 and numbers in minutes in the Wait Time column to display manual wait time. You may update system message to display, if no information is available.";
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        txt_desc.Text = String.Empty;
        txt_numdoctor.Text = String.Empty;
        txt_avgtime.Text = String.Empty;
        txt_patients.Text = String.Empty;
        txt_attended.Text = String.Empty;
        txt_date.Text = String.Empty;
        txt_waittime.Text = String.Empty;
        txt_waiting.Text = String.Empty;
        txt_dept.Text = String.Empty;
        txt_lupdate.Text = String.Empty;
        txt_message.Text = String.Empty;
        txt_updateby.Text = String.Empty;
        rpt_select.DataSource = WT.getsysinfos();
        rpt_select.DataBind();
    }

    //page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    //returns a message notifying user of success or failure committing changes to DB
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

    //Execute commands based on button clicked - if insert executes the insert and calls the _strMessage function, if update calls the _showUpdate function, if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(WT.commitInsert(txt_desc.Text, Int32.Parse(txt_numdoctor.Text.ToString()), Int32.Parse(txt_avgtime.Text.ToString()), Int32.Parse(txt_patients.Text.ToString()), Int32.Parse(txt_attended.Text.ToString()), DateTime.Parse(txt_date.Text.ToString()), Int32.Parse(txt_waittime.Text.ToString()), Int32.Parse(txt_waiting.Text.ToString()), Int32.Parse(txt_dept.Text.ToString()), DateTime.Parse(txt_lupdate.Text.ToString()), txt_message.Text, Int32.Parse(txt_updateby.Text.ToString())), "Insert");               
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

    //called by subAdmin function - makes edit panel and form visible with values from the selected row from the table
    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        rf_waittimeClass WT = new rf_waittimeClass();
        rpt_edit.DataSource = WT.getsysinfoByID(id);
        rpt_edit.DataBind();
    }

    //controls required panel visibility
    private void _panelControl(Panel pnl)
    {
        pnl_edit.Visible = false;
        pnl_new.Visible = false;
        pnl.Visible = true;
    }

    //called in edit panel and form - case update commits update and calls _strMessage function, delete deletes record and calls _strMessage. cancel calls reset
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descE");
                TextBox txtNumdoc = (TextBox)e.Item.FindControl("txt_numdoctorE");
                TextBox txtAvgtime = (TextBox)e.Item.FindControl("txt_avgtimeE");
                TextBox txtPatients = (TextBox)e.Item.FindControl("txt_patientE");
                TextBox txtAttended = (TextBox)e.Item.FindControl("txt_attendedE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateE");
                TextBox txtWaittime = (TextBox)e.Item.FindControl("txt_waittimeE");
                TextBox txtWaiting = (TextBox)e.Item.FindControl("txt_waitingE");
                TextBox txtDept = (TextBox)e.Item.FindControl("txt_deptE");
                TextBox txtLupdate = (TextBox)e.Item.FindControl("txt_lupdateE");
                TextBox txtMessage = (TextBox)e.Item.FindControl("txt_messageE");
                TextBox txtUpdateby = (TextBox)e.Item.FindControl("txt_updatebyE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");               
                int WTID = int.Parse(hdfID.Value.ToString());
                _strMessage(WT.commitUpdate(WTID, txtDesc.Text, Int32.Parse(txtNumdoc.Text.ToString()), Int32.Parse(txtAvgtime.Text.ToString()), Int32.Parse(txtPatients.Text.ToString()), Int32.Parse(txtAttended.Text.ToString()), DateTime.Parse(txtDate.Text.ToString()), Int32.Parse(txtWaittime.Text.ToString()), Int32.Parse(txtWaiting.Text.ToString()), Int32.Parse(txtDept.Text.ToString()), DateTime.Parse(txtLupdate.Text.ToString()), txtMessage.Text, Int32.Parse(txtUpdateby.Text.ToString())), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(WT.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}