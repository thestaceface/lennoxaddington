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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getdirection();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        directionClass _linq = new directionClass();
        rpt_update.DataSource = _linq.getdirectionByID(id);
        rpt_update.DataBind();
    }

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
}