using System;
using System.Collections.Generic;
using System.Linq; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
public partial class rf_waittime : System.Web.UI.Page
{
    rf_sysinfoClass WT = new rf_sysinfoClass(); 

    private void _subRebind() 
    {
        lbl_disc.Text = "Disclaimer: This is an estimate wait time. It may not be accurate as patients will be attending by the doctor on priority sequence after primary assesment. Hostipital staff will determine the priority and attention that required to be provided. Please wait for your sequence to be called. Your patients and cooperation will be highly appreciated. Thank you.";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       _calculateWaittime();
       lbl_wtime.Text = "Estimated waiting time is about " + " 2h15m. Valid at " + DateTime.Now.ToString() + ".";
       _subRebind();
    }

    private void _calculateWaittime()
    {

    }
}