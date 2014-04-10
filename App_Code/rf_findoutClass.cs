using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class rf_findoutClass
{
    public IQueryable<extlink> getExtlinks()
    {
        lennoxdbDataContext objLink = new lennoxdbDataContext();
        var allextlinks = objLink.extlinks.Select(x => x);
        return allextlinks;
    }

    public IQueryable<extlink> getExtlinkByID(int _id)
    {
        lennoxdbDataContext objLink = new lennoxdbDataContext();
        var allextlinks = objLink.extlinks.Where(x => x.el_id == _id).Select(x => x);
        return allextlinks;
    }

    public bool commitInsert(string _el_category, string _el_name, string _el_brief, string _el_link)
    {
        lennoxdbDataContext objLink = new lennoxdbDataContext();
        using (objLink)
        {
            var objNewLink = new extlink();
            objNewLink.el_category = _el_category;
            objNewLink.el_name = _el_name;
            objNewLink.el_brief = _el_brief;
            objNewLink.el_link = _el_link;
            objLink.extlinks.InsertOnSubmit(objNewLink);
            objLink.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _el_id, string _el_category, string _el_name, string _el_brief, string _el_link)
    {
        lennoxdbDataContext objLink = new lennoxdbDataContext();
        using (objLink)
        {
            var objUpLink = objLink.extlinks.Single(x => x.el_id == _el_id);
            objUpLink.el_category = _el_category;
            objUpLink.el_name = _el_name;
            objUpLink.el_brief = _el_brief;
            objUpLink.el_link = _el_link;
            objLink.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _el_id)
    {
        lennoxdbDataContext objLink = new lennoxdbDataContext();
        using (objLink)
        {
            var objDelLink = objLink.extlinks.Single(x => x.el_id == _el_id);
            objLink.extlinks.DeleteOnSubmit(objDelLink);
            objLink.SubmitChanges();
            return true;
        }
    }
}