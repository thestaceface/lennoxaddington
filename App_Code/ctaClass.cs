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

}