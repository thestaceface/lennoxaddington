using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default4 : System.Web.UI.Page
{
    // link to class file
    directionClass objLinq = new directionClass();

    // when page load, call subRebind
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    // databind repeater and make distance panel not visible
    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getdirection();
        rpt_all.DataBind();
        _panelControl(pnl_all);

        pnl_distance.Visible = false;
    }

    // panel control to make panel visible or not
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    // subAdmin (oncommand is used - maybe for later use..) for update
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    // show update panel and bind repeater
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        directionClass _linq = new directionClass();
        rpt_update.DataSource = _linq.getdirectionByID(id);
        rpt_update.DataBind();
    }

    // display message if the action (update) is successfull or not
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Update " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " job";
        }
    }

    // onCommand for update and cancel button
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                TextBox txtStreet = (TextBox)e.Item.FindControl("txt_streetU");
                TextBox txtCity = (TextBox)e.Item.FindControl("txt_cityU");
                TextBox txtProvince = (TextBox)e.Item.FindControl("txt_provinceU");
                TextBox txtPcode = (TextBox)e.Item.FindControl("txt_postalCodeU");
                TextBox txtTel = (TextBox)e.Item.FindControl("txt_telU");
                TextBox txtHours = (TextBox)e.Item.FindControl("txt_hoursU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");

                int directionID = int.Parse(hdfID.Value.ToString());

                _strMessage(objLinq.commitUpdate(directionID, txtName.Text, txtStreet.Text, txtCity.Text, txtProvince.Text, txtPcode.Text, txtTel.Text, txtHours.Text), "update");
                _subRebind();
                break;

            case "Cancel":
                _subRebind();
                break;
        }
    }

    // button to make distance panel visible
    protected void subGetDistance(object sender, EventArgs e)
    {
        pnl_distance.Visible = true;
    }

    // reset button to empty textboxes and make distance panel invisible
    protected void subReset(object sender, EventArgs e)
    {
        txtFrom.Text = string.Empty;
        txtTo.Text = string.Empty;
        pnl_distance.Visible = false;
    }
}