using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for positionClass
/// </summary>
public class positionClass
{
	public positionClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<position> getposition()
    {
        //creating an instance of our LINQ object
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        //creating an anonymous variable with its value being the instance of our LINQ object
        var allposition = objProdDC.positions.Select(x => x);
        //return IQuery<product> for data bound control to bind to
        return allposition;
    }

    public IQueryable<position> getPositionByID(int _id)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        var allposition = objProdDC.positions.Where(x => x.pn_id == _id).Select(x => x);
        return allposition;
    }

    public bool commitInsert(string _desc, string _name, string _type, DateTime _date, string _qualification, string _requirements, string _education, string _experience, string _specialities)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        //to ensure all data will be disposed when finishing
        using (objProdDC)
        {
            //create an instance of the table
            position objNewPro = new position();
            //set table columns to new values being  passed from *.aspx page

            objNewPro.pn_desc = _desc;
            objNewPro.pn_name = _name;
            objNewPro.pn_type = _type;
            objNewPro.pn_s_date = _date;
            objNewPro.pn_qualification = _qualification;
            objNewPro.pn_requirements = _requirements;
            objNewPro.pn_education = _education;
            objNewPro.pn_experience = _experience;
            objNewPro.pn_specialities = _specialities;
            //insert command
            objProdDC.positions.InsertOnSubmit(objNewPro);
            //commit insert against database
            objProdDC.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _desc, string _name, string _type, DateTime _date, string _qualification, string _requirements, string _education, string _experience, string _specialities)
    {
        lennoxdbDataContext objProdDC = new lennoxdbDataContext();
        using (objProdDC)
        {
            var objUpPro = objProdDC.positions.Single(x => x.pn_id == _id);
            objUpPro.pn_desc = _desc;
            objUpPro.pn_name = _name;
            objUpPro.pn_type = _type;
            objUpPro.pn_s_date = _date;
            objUpPro.pn_qualification = _qualification;
            objUpPro.pn_requirements = _requirements;
            objUpPro.pn_education = _education;
            objUpPro.pn_experience = _experience;
            objUpPro.pn_specialities = _specialities;
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
            var objDelPro = objProdDC.positions.Single(x => x.pn_id == _id);
            //delete command
            objProdDC.positions.DeleteOnSubmit(objDelPro);
            //commit delete against database
            objProdDC.SubmitChanges();
            return true;
        }
    }
}