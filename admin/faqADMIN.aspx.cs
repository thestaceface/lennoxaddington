using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faqADMIN : System.Web.UI.Page
{
    faqclass Fobj = new faqclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    protected void _subRebind()
    {
        rpt_edit.DataSource = Fobj.getAllData();
        rpt_edit.DataBind();
        txt_categoryI.Text = "";
        txt_questionI.Text = "";
        txt_answerI.Text = "";
    }


    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {

        lbl_msg.Text = "subUpDel";
        switch (e.CommandName)
        {
            case "Update":

                HiddenField hdfIdU = (HiddenField)e.Item.FindControl("hdf_idE");
                TextBox txtcategory = (TextBox)e.Item.FindControl("txt_categoryE");
                TextBox txtquestion = (TextBox)e.Item.FindControl("txt_questionE");
                TextBox txtanswer = (TextBox)e.Item.FindControl("txt_answerE");
                lbl_msg.Text = Fobj.commitUpdate(Int32.Parse(hdfIdU.Value.ToString()), txtcategory.Text.ToString(), txtquestion.Text.ToString(),
                    txtanswer.Text.ToString());
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
            case "Delete":
                HiddenField hdfIdD = (HiddenField)e.Item.FindControl("hdf_idE");
                lbl_msg.Text = Fobj.commitDelete(Int32.Parse(hdfIdD.Value.ToString()));
                _subRebind();
                break;
        }

    }

    protected void subCancel(object sender, EventArgs e)
    {
        _subRebind();
    }

    protected void subInsert(object sender, EventArgs e)
    {
        lbl_msg.Text = Fobj.commitInsert(txt_categoryI.Text.ToString(), txt_questionI.Text.ToString(), txt_answerI.Text.ToString());
        _subRebind();
    }
}
