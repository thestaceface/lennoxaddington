using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    // donation class
    donationClass objLinq = new donationClass();

    //rebind - reset
    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getdonation();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    // on page load, rebind
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    // subAdmin for update and delete
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    // update panel and repeater
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        donationClass _linq = new donationClass();
        rpt_update.DataSource = _linq.getDonationByID(id);
        rpt_update.DataBind();
    }

    // delete panel and repeater
    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objLinq.getDonationByID(id);
        rpt_delete.DataBind();
    }

    // panel control - change for update and delete
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    // message - update delete
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Product " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " product";
        }
    }

    // commit update or delete
    // cancel
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleU");
                TextBox txtfname = (TextBox)e.Item.FindControl("txt_fnameU");
                TextBox txtlname = (TextBox)e.Item.FindControl("txt_lnameU");
                TextBox txtTel = (TextBox)e.Item.FindControl("txt_telU");
                TextBox txtCel = (TextBox)e.Item.FindControl("txt_celU");
                TextBox txtStreet = (TextBox)e.Item.FindControl("txt_streetU");
                TextBox txtApt = (TextBox)e.Item.FindControl("txt_aptU");
                TextBox txtCity = (TextBox)e.Item.FindControl("txt_cityU");
                TextBox txtPro = (TextBox)e.Item.FindControl("txt_provinceU");
                TextBox txtCoun = (TextBox)e.Item.FindControl("txt_countryU");
                TextBox txtAmount = (TextBox)e.Item.FindControl("txt_amountU");
                TextBox txtPostal = (TextBox)e.Item.FindControl("txt_postalU");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailU");
                TextBox txtTran = (TextBox)e.Item.FindControl("txt_tranU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                int positionID = int.Parse(hdfID.Value.ToString());

                _strMessage(objLinq.commitUpdate(positionID, txtTitle.Text, txtfname.Text, txtlname.Text, txtTel.Text, txtCel.Text, txtStreet.Text, txtApt.Text, txtCity.Text, txtPro.Text, txtCoun.Text, Decimal.Parse(txtAmount.Text.ToString()), txtPostal.Text, txtEmail.Text, txtTran.Text), "update");
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
}