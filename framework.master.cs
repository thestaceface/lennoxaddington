using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class framework : System.Web.UI.MasterPage
{
    ctaClass objPage = new ctaClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        string pageurl = Request.Url.PathAndQuery;

        if (!Page.User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }

        dtl_edit.DataSource = objPage.getPageByUrl(pageurl);//find this page in the database by url.  why url and not id?  because then i can define ctas for non-contentMain pages, as long as i have the right urls
        dtl_edit.DataBind();
    }

    private void _subRebind()  //binds the data to the pagelist.  not the form.  
    {
        Control cta1control;
        cta1control = LoadControl("cta/wl_cta_faq.ascx");
        cta1.Controls.Add(cta1control);


        Control cta2control;
        cta2control = LoadControl("cta/wl_cta_faq.ascx");
        cta2.Controls.Add(cta2control);
    }

    protected void ctaLoader(object sender, DataListItemEventArgs e)
    {
        //Repeater blah = new Repeater();//used in testing
        //Label hmm = (Label)e.Item.FindControl("lbl_cta1");
        //lbl.Text = hmm.Text;

        //Repeater sideRepeater = new Repeater();//used in testing
        Control cta1control;
        Control cta2control;
        //Label lblCTA1 = (Label)e.Item.FindControl("lbl_cta1");//used in testing
        //Label lblCTA2 = (Label)e.Item.FindControl("lbl_cta2");

        HiddenField hdfCTA1 = (HiddenField)e.Item.FindControl("hdf_cta1");
        HiddenField hdfCTA2 = (HiddenField)e.Item.FindControl("hdf_cta2");
        //lbl.Text = hdfCTA1.Value;

        switch (hdfCTA1.Value)//hidden value... activates a cta depending on the cta_id
        {
            case "1":
                cta1control = LoadControl("cta/wl_cta_donate.ascx");
                cta1.Controls.Add(cta1control);
                break;
            case "2":
                cta1control = LoadControl("cta/wl_cta_faq.ascx");
                cta1.Controls.Add(cta1control);
                break;
            case "3":
                cta1control = LoadControl("cta/wl_cta_newsletter.ascx");
                cta1.Controls.Add(cta1control);
                break;
            case "4":
                cta1control = LoadControl("cta/wl_cta_flushot.ascx");
                cta1.Controls.Add(cta1control);
                break;
            default:
                break;
        }
        switch (hdfCTA2.Value)
        {
            case "1":
                cta2control = LoadControl("cta/wl_cta_donate.ascx");
                cta1.Controls.Add(cta2control);
                break;
            case "2":
                cta2control = LoadControl("cta/wl_cta_faq.ascx");
                cta1.Controls.Add(cta2control);
                break;
            case "3":
                cta2control = LoadControl("cta/wl_cta_newsletter.ascx");
                cta1.Controls.Add(cta2control);
                break;
            case "4":
                cta2control = LoadControl("cta/wl_cta_flushot.ascx");
                cta2.Controls.Add(cta2control);
                break;
            default:
                break;
        }
    }
}
