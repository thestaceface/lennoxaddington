using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for applicationClass
/// </summary>
public class applicationClass
{
	public applicationClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<applicant> getapplicant()
    {
        //creating an instance of our LINQ object
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        //creating an anonymous variable with its value being the instance of our LINQ object
        var allapplicant = objProdDC.applicants.Select(x => x);
        //return IQuery<product> for data bound control to bind to
        return allapplicant;
    }

    public IQueryable<applicant> getapplicantByID(int _id)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        var allapplicant = objProdDC.applicants.Where(x => x.ap_id == _id).Select(x => x);
        return allapplicant;
    }

    public bool commitInsert(string _name, string _email, string _letter, Byte[] _upload)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        //to ensure all data will be disposed when finishing
        using (objProdDC)
        {
            //create an instance of the table
            applicant objNewPro = new applicant();
            //set table columns to new values being  passed from *.aspx page

            objNewPro.ap_name = _name;
            objNewPro.ap_email = _email;
            objNewPro.ap_letter = _letter;
            objNewPro.ap_upload = _upload;
            //insert command
            objProdDC.applicants.InsertOnSubmit(objNewPro);
            //commit insert against database
            objProdDC.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _name, string _email, string _letter, Byte[] _upload)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        using (objProdDC)
        {
            var objUpPro = objProdDC.applicants.Single(x => x.ap_id == _id);
            objUpPro.ap_name = _name;
            objUpPro.ap_email = _email;
            objUpPro.ap_letter = _letter;
            objUpPro.ap_upload = _upload;
            //commit update against database
            objProdDC.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        using (objProdDC)
        {
            var objDelPro = objProdDC.applicants.Single(x => x.ap_id == _id);
            //delete command
            objProdDC.applicants.DeleteOnSubmit(objDelPro);
            //commit delete against database
            objProdDC.SubmitChanges();
            return true;
        }
    }
}