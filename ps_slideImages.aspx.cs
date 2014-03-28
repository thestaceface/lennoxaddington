using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    ps_sliderImage obj = new ps_sliderImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        rpt_main.DataSource = obj.getImages();
        rpt_main.DataBind();
    }
}