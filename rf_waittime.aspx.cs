using System;
using System.Collections.Generic;
using System.Linq; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
public partial class rf_waittime : System.Web.UI.Page
{
    rf_waittimeClass WT = new rf_waittimeClass(); 
    

    private void _subRebind() 
    {
        lbl_disc.Text = "Disclaimer: This is an estimate wait time. It may not be accurate as patients will be attending by the doctor on priority sequence after primary assesment. Hostipital staff will determine the priority and attention that required to be provided. Please wait for your sequence to be called. Your patients and cooperation will be highly appreciated. Thank you.";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //_calculateWaittime(id);
        lbl_wtime.Text = "Estimated waiting time is about " + " 2h15m. Valid at " + DateTime.Now.ToString() + ".";
    }

    protected void _calculateWaittime(int id)
    {
        var rec = WT.getsysinfoByID(id);
        //How to get full record access here?
        //How to refer following columns from the record here
        //I want to calculate waittime using following columns from sysinfo table
        // si_waittime = (si_numwaiting * si_avgtime) / si_numdoctor
    }
}