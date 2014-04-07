using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for newsclass
/// </summary>
public class newsclass
{
    public IQueryable<newsletter> getFeedbacks()
    {
        lennoxdbDataContext objnewsletter = new lennoxdbDataContext();
        var allnewsletters = objnewsletter.newsletters.Select(x => x);
        return allnewsletters;
    }

    public IQueryable<newsletter> getnewsletterByID(int _id)
    {
        lennoxdbDataContext objN = new lennoxdbDataContext();
        var allnewsletters = objN.newsletters.Where(x => x.fd_id == _id).Select(x => x);
        return allnewsletters;
    }

    public bool commitInsert(string _fd_subject, string _fd_last, string _fd_first, string _fd_email, string _fd_message)
    {
        lennoxdbDataContext objN = new lennoxdbDataContext();
        using (objN)
        {
            var objNewN = new newsletter();
            objNewN.fd_last = _fd_last;
            objNewN.fd_first = _fd_first;
            objNewN.fd_email = _fd_email;
            objNewN.fd_message = _fd_message;
            objNewN.fd_selector = DateTime.Now.ToString() + " - " + _fd_subject + " by " + _fd_first + " " + _fd_last;
            objN.newsletters.InsertOnSubmit(objNewN);
            objN.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _fd_subject, string _fd_last, string _fd_first, string _fd_email, string _fd_message)
    {
        lennoxdbDataContext objN = new lennoxdbDataContext();
        using (objN)
        {
            var objUpN = objN.newsletters.Single(x => x._id == _id);
            objUpN.fd_last = _fd_last;
            objUpN.fd_first = _fd_first;
            objUpN.fd_email = _fd_email;
            objUpN.fd_message = _fd_message;
            objN.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objN = new lennoxdbDataContext();
        using (objN)
        {
            var objDelN = objN.newsletters.Single(x => x._id == _id);
            objN.newsletters.DeleteOnSubmit(objDelN);
            objN.SubmitChanges();
            return true;
        }
    }
}
