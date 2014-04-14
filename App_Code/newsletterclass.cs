using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for newsclass
/// </summary>
public class newsletterclass
{

    public IQueryable<newsletter> getnewsletter()
    {
        lennoxdbDataContext objnewsletter = new lennoxdbDataContext();
        var allnewsletters = objnewsletter.newsletters.Select(x => x);
        return allnewsletters;

    }

    public IQueryable<newsletter> getnewsletterByID(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        var allnewsletter = objE.newsletters.Where(x => x.Id == _id).Select(x => x);
        return allnewsletter;
    }

    public string commitInsert(string _n_fname, string _n_lname, string _n_email)
    {
        lennoxdbDataContext objI = new lennoxdbDataContext();
        using (objI)
        {
            var objNewE = new newsletter();
            objNewE.fname = _n_fname;
            objNewE.lname = _n_lname;
            objNewE.email = _n_email;
            objI.newsletters.InsertOnSubmit(objNewE);
            objI.SubmitChanges();
            return "Your message was sent successfully";
        }
    }

    public string commitUpdate(int _id, string _e_fname, string _e_lname, string _e_email)
    {
        lennoxdbDataContext objU = new lennoxdbDataContext();
        using (objU)
        {
            var objUpE = objU.ecards.Single(x => x.Id == _id);
            objUpE.fname = _e_fname;
            objUpE.lname = _e_lname;
            objUpE.email = _e_email;
            objU.SubmitChanges();
            return "Your update was successful";
        }
    }

    public string commitDelete(int _id)
    {
        lennoxdbDataContext objE = new lennoxdbDataContext();
        using (objE)
        {
            var objDelE = objE.newsletters.Single(x => x.Id == _id);
            objE.newsletters.DeleteOnSubmit(objDelE);
            objE.SubmitChanges();
            return "Your delete was successful";
        }
    }
}

