using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ecardclass
/// </summary>

public class ecardclass
{
    
    public IQueryable<ecard> getecards()
    {
        lennoxdbDataContext objecard = new lennoxdbDataContext();
        var allecards = objecard.ecards.Select(x => x);
        return allecards;
    }

    public IQueryable<ecard> getecardsByID(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        var allecard = objE.ecards.Where(x => x.Id == _id).Select(x => x);
        return allecard;
    }

    public string commitInsert(string _e_subject, string _e_last, string _e_first, string _e_email, string _e_message)
    {
        lennoxdbDataContext objI = new lennoxdbDataContext();
        using (objI)
        {
            var objNewE = new ecard();
            objNewE.fname = _e_first;
            objNewE.lname = _e_last;
            objNewE.email = _e_email;
            objNewE.subject = _e_subject;
            objNewE.message = _e_message;
            objI.ecards.InsertOnSubmit(objNewE);
            objI.SubmitChanges();
            return "Your message was sent successfully"; 
        }
    }

    public string commitUpdate(int _id, string _e_subject, string _e_last, string _e_first, string _e_email, string _e_message)
    {
        lennoxdbDataContext objU = new lennoxdbDataContext();
        using (objU)
        {
            var objUpE = objU.ecards.Single(x => x.Id == _id);
            objUpE.lname = _e_last;
            objUpE.fname = _e_first;
            objUpE.email = _e_email;
            objUpE.message = _e_message;
            objU.SubmitChanges();
            return "Your update was successful";
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        using (objE)
        {
            var objDelE = objE.ecards.Single(x => x.Id == _id);
            objE.ecards.DeleteOnSubmit(objDelE);
            objE.SubmitChanges();
            return true;
        }
    } 
}

