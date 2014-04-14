using System;
using System.Collections.Generic;
using System.Linq; 
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Rezwanul Ferdous 824-259-246
 
public partial class rf_waittime : System.Web.UI.Page
{
    //creating instance of the class file
    rf_waittimeClass WT = new rf_waittimeClass();  

    private void _subRebind() 
    {
        //Disclaimer public notice text initiallizing
        lbl_disc.Text = "Disclaimer: This is an estimate wait time. It may not be accurate as patients will be attending by the doctor on priority basis after primary assesment. Hostipital staff will determine the priority and attention that required to be provided. You have to wait for the patient name to be called. Your cooperation will be highly appreciated. Thank you.";
    }

    //Calculating wait time during page load
    protected void Page_Load(object sender, EventArgs e)
    {
        _calculateWaittime(1);
       _subRebind();
       //if user is logged in as administrator, edit button is visible
       if (!User.IsInRole("administrator"))
       {
           lnk_admin.Visible = false;
       }
    }

    //Auto re-calculating wait time based on the timer setting
    protected void subTick(object sender, EventArgs e)//
    {
        _calculateWaittime(1);
        _subRebind();
    }

    /*function to calculate wait time based on information available
     *Function will calculate wait time by (average wait time * patients waiting) / Number of Doctors on duty
     *Function will check manual wait time if above calculation return 0
     *Display system message for "Information not available", if manual wait time not entered.
     *Message will display in different label for green and red color based on wait time > 3 hours
     */ 
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
                  if (wait < 180)
                  {
                      lbl_wtime1.Text = "Estimated waiting time is about " + hrs.ToString() + "h" + mins.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
                      lbl_wtime1.Visible = true;
                      lbl_wtime2.Visible = false;
                  }
                  else
                  {
                      lbl_wtime2.Text = "Estimated waiting time is about " + hrs.ToString() + "h" + mins.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
                      lbl_wtime2.Visible = true;
                      lbl_wtime1.Visible = false;
                  }
              }
              else
              {
                  if (obj.si_waittime > 0)
                  {
                      var wait1 = obj.si_waittime;
                      var hrs1 = wait1 / 60;
                      var mins1 = wait1 - (hrs1 * 60);
                      lbl_wtime1.Text = "Estimated waiting time is about " + hrs1.ToString() + "h" + mins1.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
                      lbl_wtime1.Visible = true;
                      lbl_wtime2.Visible = false;
                      if (hrs > 2 || hrs1 > 2)
                      {
                          lbl_wtime2.Text = "Estimated waiting time is about " + hrs1.ToString() + "h" + mins1.ToString() + "m. Valid at " + DateTime.Now.ToString() + ".";
                          lbl_wtime2.Visible = true;
                          lbl_wtime1.Visible = false;
                      }
                  }
                  else
                  {
                      lbl_wtime2.Text = obj.si_message;
                      lbl_wtime2.Visible = true;
                      lbl_wtime1.Visible = false;
                  }
              }
            }
        }
    }
}