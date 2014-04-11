using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    // on page load, rebind
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }

    // rebind - empty all textboxes
    private void _subRebind()
    {
        txt_first.Text = string.Empty;
        txt_last.Text = string.Empty;
        txt_street.Text = string.Empty;
        txt_app.Text = string.Empty;
        txt_city.Text = string.Empty;
        txt_province.Text = string.Empty;
        txt_postal.Text = string.Empty;
        txt_phone.Text = string.Empty;
        txt_cell.Text = string.Empty;
        txt_email.Text = string.Empty;
    }

    // querystring - send parameters (title, name, address, phone and email) via url when button is clicked
    protected void btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/donationConfirm.aspx?title=" + ddl_title.SelectedItem.Text + "&fname=" + txt_first.Text + "&lname=" + txt_last.Text
            + "&street=" + txt_street.Text + "&app=" + txt_app.Text + "&city=" + txt_city.Text + "&province=" + txt_province.Text + "&country=" + ddl_country.SelectedItem.Text
            + "&postal=" + txt_postal.Text + "&phone=" + txt_phone.Text + "&cell=" + txt_cell.Text + "&email=" + txt_email.Text);
    }
}