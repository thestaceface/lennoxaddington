using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for careerClass
/// </summary>
public class donationClass
{
    public donationClass()
	{
		
         //TODO: Add constructor logic here
		
	}

    public IQueryable<donation> getdonation()
    {
        //creating an instance of our LINQ object
        lennoxdbDataContext objDonDC = new lennoxdbDataContext();
        //creating an anonymous variable with its value being the instance of our LINQ object
        var alldonation = objDonDC.donations.Select(x => x);
        //return IQuery<product> for data bound control to bind to
        return alldonation;
    }

    public IQueryable<donation> getDonationByID(int _id)
    {
        lennoxdbDataContext objDonDC = new lennoxdbDataContext();
        var alldonation = objDonDC.donations.Where(x => x.dn_id == _id).Select(x => x);
        return alldonation;
    }

    public bool commitInsert(string _title, string _first, string _last, string _street, string _apt, string _city, string _province, string _country, string _postal, string _tel, string _cell, string _email, decimal _amount, string _tran)
    {
        lennoxdbDataContext objDonDC = new lennoxdbDataContext();
        //to ensure all data will be disposed when finishing
        using (objDonDC)
        {
            //create an instance of the table
            donation objNewDon = new donation();
            //set table columns to new values being  passed from *.aspx page

            objNewDon.dn_title = _title;
            objNewDon.dn_first = _first;
            objNewDon.dn_last = _last;
            objNewDon.dn_tel = _tel;
            objNewDon.dn_cell = _cell;
            objNewDon.dn_street = _street;
            objNewDon.dn_apt = _apt;
            objNewDon.dn_city = _city;
            objNewDon.dn_province = _province;
            objNewDon.dn_country = _country;
            objNewDon.dn_amount = _amount;
            objNewDon.dn_postal = _postal;
            objNewDon.dn_email = _email;
            objNewDon.dn_transaction = _tran;
            //insert command
            objDonDC.donations.InsertOnSubmit(objNewDon);
            //commit insert against database
            objDonDC.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _title, string _first, string _last, string _tel, string _cell, string _street, string _apt, string _city, string _province, string _country, decimal _amount, string _postal, string _email, string _tran)
    {
        lennoxdbDataContext objDonDC = new lennoxdbDataContext();
        using (objDonDC)
        {
            var objUpDon = objDonDC.donations.Single(x => x.dn_id == _id);
            objUpDon.dn_title = _title;
            objUpDon.dn_first = _first;
            objUpDon.dn_last = _last;
            objUpDon.dn_tel = _tel;
            objUpDon.dn_cell = _cell;
            objUpDon.dn_street = _street;
            objUpDon.dn_apt = _apt;
            objUpDon.dn_city = _city;
            objUpDon.dn_province = _province;
            objUpDon.dn_country = _country;
            objUpDon.dn_amount = _amount;
            objUpDon.dn_postal = _postal;
            objUpDon.dn_email = _email;
            objUpDon.dn_transaction = _tran;
            //commit update against database
            objDonDC.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objDonDC = new lennoxdbDataContext();
        using (objDonDC)
        {
            var objDelDon = objDonDC.donations.Single(x => x.dn_id == _id);
            //delete command
            objDonDC.donations.DeleteOnSubmit(objDelDon);
            //commit delete against database
            objDonDC.SubmitChanges();
            return true;
        }
    }
}