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
        _calculateWaittime(1);
       _subRebind();
    }

    protected void _calculateWaittime(int id)
    {
        IQueryable<sysinfo> rec = WT.getsysinfoByID(id);
        if (rec.Count() > 0)
        {
            foreach (sysinfo obj in rec)
            {             
              var wait = (obj.si_avgtime * (obj.si_numregistered - obj.si_numattended)) / obj.si_numdoctor;
              var hrs = wait / 60;
              var mins = wait - (hrs * 60);
              if (wait > 0)
              {
                  lbl_wtime.Text = "Estimated waiting time is about " + hrs.ToString() + "h" + mins.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
              }
              else
              {
                  if (obj.si_waittime > 0)
                  {
                      var wait1 = obj.si_waittime;
                      var hrs1 = wait1 / 60;
                      var mins1 = wait1 - (hrs1 * 60);
                      lbl_wtime.Text = "Estimated waiting time is about " + hrs1.ToString() + "h" + mins1.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
                  }
                  else
                  {
                      lbl_wtime.Text = "Estimated waiting time is not available at this time. Please check again later.";
                  }
              }
            }
        }
    }
}