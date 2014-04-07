using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ecardclass
/// </summary>
public class ecardclass
{
    public IQueryable<ecard> getFeedbacks()
    {
        lennoxdbDataContext objecard = new lennoxdbDataContext();
        var allecards = objecard.ecards.Select(x => x);
        return allecards;
    }

    public IQueryable<ecard> getnewsletterByID(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        var allnewsletters = objE.ecards.Where(x => x.fd_id == _id).Select(x => x);
        return allecards;
    }

    public bool commitInsert(string _fd_subject, string _fd_last, string _fd_first, string _fd_email, string _fd_message)
    {
        lennoxdbDataContext objN = new lennoxdbDataContext();
        using (objE)
        {
            var objNewE = new ecard();
            objNewE.fd_last = _fd_last;
            objNewE.fd_first = _fd_first;
            objNewE.fd_email = _fd_email;
            objNewE.fd_message = _fd_message;
            objNewE.fd_selector = DateTime.Now.ToString() + " - " + _fd_subject + " by " + _fd_first + " " + _fd_last;
            objN.newsletters.InsertOnSubmit(objNewE);
            objN.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _fd_subject, string _fd_last, string _fd_first, string _fd_email, string _fd_message)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        using (objE)
        {
            var objUpE = objE.ecards.Single(x => x._id == _id);
            objUpE.fd_last = _fd_last;
            objUpE.fd_first = _fd_first;
            objUpE.fd_email = _fd_email;
            objUpE.fd_message = _fd_message;
            objE.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        using (objE)
        {
            var objDelE = objE.newsletters.Single(x => x._id == _id);
            objE.newsletters.DeleteOnSubmit(objDelE);
            objE.SubmitChanges();
            return true;
        }
    }
}
