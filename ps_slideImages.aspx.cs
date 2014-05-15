using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ps_slideImage : System.Web.UI.Page
{
    ps_sliderImage obj = new ps_sliderImage();  //creating instance of the class file
    protected void Page_Load(object sender, EventArgs e)
    {
        //getting all the images and binding to DB
        //rpt_main.DataSource = obj.getImages();
        //rpt_main.DataBind();

        //if user is logged in as administrator, edit button is visible
        if (!User.IsInRole("administrator"))
        {
            lnk_admin.Visible = false;
        }
    }
}