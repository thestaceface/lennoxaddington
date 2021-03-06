﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    // link to class file
    positionClass objLinq = new positionClass();
    applicationClass objLinq2 = new applicationClass();

    //rebind - reset
    private void _subRebind()
    {
        txt_descI.Text = string.Empty;
        txt_nameI.Text = string.Empty;
        txt_typeI.Text = string.Empty;
        txt_dateI.Text = string.Empty;
        txt_quaI.Text = string.Empty;
        txt_reqI.Text = string.Empty;
        txt_eduI.Text = string.Empty;
        txt_expI.Text = string.Empty;
        txt_specI.Text = string.Empty;
        rpt_all.DataSource = objLinq.getposition();
        rpt_all.DataBind();
        _panelControl(pnl_all);

        rpt_Appliall.DataSource = objLinq2.getapplicant();
        rpt_Appliall.DataBind();
        _panelControl2(pnl_Appliall);
    }

    // on page load, rebind
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    // subroutine for insert, update and delete for career
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(txt_descI.Text, txt_nameI.Text, txt_typeI.Text, DateTime.Parse(txt_dateI.Text.ToString()), txt_quaI.Text, txt_reqI.Text, txt_eduI.Text, txt_expI.Text, txt_specI.Text), "insert");
                _subRebind();
                break;

            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    // show update panel
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        positionClass _linq = new positionClass();
        rpt_update.DataSource = _linq.getPositionByID(id);
        rpt_update.DataBind();
    }

    // show delete panel
    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objLinq.getPositionByID(id);
        rpt_delete.DataBind();
    }

    // change panel
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    // display message - successful or not
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Job " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " job";
        }
    }

    // update delete cancel
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                TextBox txtType = (TextBox)e.Item.FindControl("txt_typeU");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU");
                TextBox txtQua = (TextBox)e.Item.FindControl("txt_quaU");
                TextBox txtReq = (TextBox)e.Item.FindControl("txt_reqU");
                TextBox txtEdu = (TextBox)e.Item.FindControl("txt_eduU");
                TextBox txtExp = (TextBox)e.Item.FindControl("txt_expU");
                TextBox txtSpec = (TextBox)e.Item.FindControl("txt_specU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                int positionID = int.Parse(hdfID.Value.ToString());

                _strMessage(objLinq.commitUpdate(positionID, txtDesc.Text, txtName.Text, txtType.Text, DateTime.Parse(txtDate.Text.ToString()), txtQua.Text, txtReq.Text, txtEdu.Text, txtExp.Text, txtSpec.Text), "update");
                _subRebind();
                break;

            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idD")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;

            case "Cancel":
                _subRebind();
                break;
        }
    }

    // applicant details

    // update delete subroutine
    protected void subAdminAppli(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate2(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Delete":
                _showDelete2(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    // show update panel
    private void _showUpdate2(int id)
    {
        _panelControl2(pnl_Appliupdate);
        applicationClass _linq = new applicationClass();
        rpt_Appliupdate.DataSource = _linq.getapplicantByID(id);
        rpt_Appliupdate.DataBind();
    }

    // delete panel
    private void _showDelete2(int id)
    {
        _panelControl2(pnl_Applidelete);
        rpt_Applidelete.DataSource = objLinq2.getapplicantByID(id);
        rpt_Applidelete.DataBind();
    }

    // change panel
    private void _panelControl2(Panel pnl)
    {
        pnl_Appliall.Visible = false;
        pnl_Applidelete.Visible = false;
        pnl_Appliupdate.Visible = false;
        pnl.Visible = true;
    }

    // message display either successful or not
    private void _strMessage2(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Job " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " job";
        }
    }

    // commit update or delete, cancel>rebind
    protected void subUpDel2(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                TextBox txtType = (TextBox)e.Item.FindControl("txt_typeU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                int id = int.Parse(hdfID.Value.ToString());

                _strMessage2(objLinq2.commitUpdate(id, txtDesc.Text, txtName.Text, txtType.Text, null), "update");
                _subRebind();
                break;

            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idD")).Value);
                _strMessage2(objLinq2.commitDelete(_id), "delete");
                _subRebind();
                break;

            case "Cancel":
                _subRebind();
                break;
        }
    }
}