using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ps_appointmentADMIN : System.Web.UI.Page
{
    //creating instance of the class file
    ps_appointmentClass objApp = new ps_appointmentClass();

    //calls page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    //resets all fields on page (re)load
    private void _subRebind()
    {
        rpt_all.DataSource = objApp.getAppointments();
        rpt_all.DataBind();
        _panelControl(pnl_all);

    }

    //handles button commands - if delete calls the _showDelete function,  if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                
                break;
            case"Cancel":
                _subRebind();
                break;
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    //called in update form - case delete commits delete , cancel calls reset ,update commits update
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idD")).Value);
                _strMessage(objApp.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Update":
                TextBox txtPatname = (TextBox)e.Item.FindControl("txt_patnameU");
                TextBox txtHcard = (TextBox)e.Item.FindControl("txt_hcardU");
                TextBox txtDept = (TextBox)e.Item.FindControl("txt_deptU");
                TextBox txtDocname = (TextBox)e.Item.FindControl("txt_docnameU");
                TextBox txtReason = (TextBox)e.Item.FindControl("txt_reasonU");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU");
                TextBox txtTime = (TextBox)e.Item.FindControl("txt_timeU");
                HiddenField hdfId = (HiddenField)e.Item.FindControl("hdf_idU");
                int id = int.Parse(hdfId.Value.ToString());
                _strMessage(objApp.commitUpdate(id, txtPatname.Text, txtHcard.Text, txtDept.Text, txtDocname.Text, txtReason.Text, txtDate.Text,txtTime.Text),"update");
                _subRebind();
                break;

           

            case "Cancel":
                _subRebind();
                break;
        }
    }

    //called by admin - makes update panel and form visible
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        ps_appointmentClass obj = new ps_appointmentClass();
        rpt_update.DataSource=obj.getAppointmentByID(id);
        rpt_update.DataBind();
    }
    //called by subAdmin - makes delete panel and form visible
    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        rpt_delete.DataSource = objApp.getAppointmentByID(id);
        rpt_delete.DataBind();
    }

    //controls panel visibility
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }

    //notifies of success or failure to commit to DB
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text ="Your " + " "  + str +  " " + "was successful";
        }
            else
        {
            lbl_msg.Text = "Sorry unable to book your" + str;
        }
    }
}