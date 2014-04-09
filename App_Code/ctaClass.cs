using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ctaClass
{
    public IQueryable<cta> getCtas()
    {
        lennoxdbDataContext obj = new lennoxdbDataContext();
        var allCtas = obj.ctas.Select(x => x);
        return allCtas;
    }

    public IQueryable<contentpage> getPageById(int _cp_id)
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();
        var onePage = objPage.contentpages.Where(x => x.cp_id == _cp_id).Select(x => x);
        return onePage;
    }

    public IQueryable<contentpage> getPageByUrl(string _cp_url)
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();
        var onePage = objPage.contentpages.Where(x => x.cp_url == _cp_url).Select(x => x);
        return onePage;
    }


}