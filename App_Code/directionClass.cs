using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for directionClass
/// </summary>
public class directionClass
{
	public directionClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<hospitalDetail> getdirection()
    {
        //creating an instance of our LINQ object
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        //creating an anonymous variable with its value being the instance of our LINQ object
        var alldirection = objProdDC.hospitalDetails.Select(x => x);
        //return IQuery<hospitalDetail> for data bound control to bind to
        return alldirection;
    }

    public IQueryable<hospitalDetail> getdirectionByID(int _id)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        var alldirection = objProdDC.hospitalDetails.Where(x => x.id == _id).Select(x => x);
        return alldirection;
    }

    public bool commitUpdate(int _id, string _name, string _street, string _city, string _province, string _pcode, string _tel, string _hours)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        using (objProdDC)
        {
            var objUpPro = objProdDC.hospitalDetails.Single(x => x.id == _id);
            objUpPro.name = _name;
            objUpPro.street = _street;
            objUpPro.city = _city;
            objUpPro.province = _province;
            objUpPro.postalCode = _pcode;
            objUpPro.tel = _tel;
            objUpPro.hours = _hours;
            //commit update against database
            objProdDC.SubmitChanges();
            return true;
        }
    }
}