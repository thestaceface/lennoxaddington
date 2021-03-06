﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Rezwanul Ferdous - 824-259-246

public partial class Default2 : System.Web.UI.Page
{
    //creating new instance of class
    rf_feedbackClass FB = new rf_feedbackClass();

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
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
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
        rpt_select.DataSource = FB.getFeedbacks();
        rpt_select.DataBind();
    }

    //page reset
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
                _strMessage(FB.commitInsert(ddl_category.Text, txt_subject.Text, txt_last.Text, txt_first.Text, txt_tel.Text, txt_email.Text, txt_street.Text, txt_appt.Text, txt_city.Text, txt_province.Text, txt_country.Text, txt_message.Text), "Insert");
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
        rf_feedbackClass FB = new rf_feedbackClass();
        rpt_edit.DataSource = FB.getFeedbackByID(id);
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
                TextBox txtCategory = (TextBox)e.Item.FindControl("txt_categoryE");
                TextBox txtSubject = (TextBox)e.Item.FindControl("txt_subjectE");
                TextBox txtLast = (TextBox)e.Item.FindControl("txt_LastE");
                TextBox txtFirst = (TextBox)e.Item.FindControl("txt_firstE");
                TextBox txtTel = (TextBox)e.Item.FindControl("txt_telE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtStreet = (TextBox)e.Item.FindControl("txt_streetE");
                TextBox txtAppt = (TextBox)e.Item.FindControl("txt_apptE");
                TextBox txtCity = (TextBox)e.Item.FindControl("txt_cityE");
                TextBox txtProvince = (TextBox)e.Item.FindControl("txt_provinceE");
                TextBox txtCountry = (TextBox)e.Item.FindControl("txt_countryE");
                TextBox txtMessage = (TextBox)e.Item.FindControl("txt_messageE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int FBID = int.Parse(hdfID.Value.ToString());
                _strMessage(FB.commitUpdate(FBID, txtCategory.Text, txtSubject.Text, txtLast.Text, txtFirst.Text, txtTel.Text, txtEmail.Text, txtStreet.Text, txtAppt.Text, txtCity.Text, txtProvince.Text, txtCountry.Text, txtMessage.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(FB.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}