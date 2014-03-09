using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class sm_directoryClass
{
    public IQueryable<office> getOffices()
    {
        lennoxdbDataContext objOff = new lennoxdbDataContext();
        var allOffices = objOff.offices.Select(x => x);
        return allOffices;
    }

    public IQueryable<office> getOfficesByID(int _id)
    {
        lennoxdbDataContext objOff = new lennoxdbDataContext();
        var allOffices = objOff.offices.Where(x => x.of_id == _id).Select(x => x);
        return allOffices;
    }

    public bool commitInsert(int _of_dept_id, string _of_title, string _of_contacttype, string _of_contact, string _of_tel, string _of_fax, string _of_email, string _of_location)
    {
        lennoxdbDataContext objOff = new lennoxdbDataContext();
        using (objOff)
        {
            var objNewOff = new office();
            objNewOff.of_dept_id = _of_dept_id;
            objNewOff.of_title = _of_title;
            objNewOff.of_contacttype = _of_contacttype;
            objNewOff.of_contact = _of_contact;
            objNewOff.of_tel = _of_tel;
            objNewOff.of_fax = _of_fax;
            objNewOff.of_email = _of_email;
            objNewOff.of_location = _of_location;
            objOff.offices.InsertOnSubmit(objNewOff);
            objOff.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _of_id, int _of_dept_id, string _of_title, string _of_contacttype, string _of_contact, string _of_tel, string _of_fax, string _of_email, string _of_location)
    {
        lennoxdbDataContext objOff = new lennoxdbDataContext();
        using (objOff)
        {
            var objUpOff = objOff.offices.Single(x => x.of_id == _of_id);
            objUpOff.of_dept_id = _of_dept_id;
            objUpOff.of_title = _of_title;
            objUpOff.of_contacttype = _of_contacttype;
            objUpOff.of_contact = _of_contact;
            objUpOff.of_tel = _of_tel;
            objUpOff.of_fax = _of_fax;
            objUpOff.of_email = _of_email;
            objUpOff.of_location = _of_location;
            objOff.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _of_id)
    {
        lennoxdbDataContext objOff = new lennoxdbDataContext();
        using (objOff)
        {
            var objDelOff = objOff.offices.Single(x => x.of_id == _of_id);
            objOff.offices.DeleteOnSubmit(objDelOff);
            objOff.SubmitChanges();
            return true;
        }
    }
}