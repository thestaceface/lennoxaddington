using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Code by Stacey Masson

public class sm_finddocClass
{
    //gets all doctor records
    public IQueryable<doctor> getDoctors()
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.doctors.Select(x => x).OrderBy(x => x.doc_name);
        return allDoctors;
    }

    //gets doctors based on ID parameter
    public IQueryable<doctor> getDoctorByID(int _doc_id)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.doctors.Where(x => x.doc_id == _doc_id).Select(x => x);
        return allDoctors;
    }

    //inserts values to DB
    public bool commitInsert(string _doc_name, string _doc_bio, string _doc_img)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        using (objDoc)
        {
            var objNewDoc = new doctor();
            objNewDoc.doc_name = _doc_name;
            objNewDoc.doc_bio = _doc_bio;
            objNewDoc.doc_img = _doc_img;
            objDoc.doctors.InsertOnSubmit(objNewDoc);
            objDoc.SubmitChanges();
            return true;
        }
    }

    //updates values in DB where ID matches
    public bool commitUpdate(int _doc_id, string _doc_name, string _doc_bio, string _doc_img)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        using (objDoc)
        {
            var objUpDoc = objDoc.doctors.Single(x => x.doc_id == _doc_id);
            objUpDoc.doc_name = _doc_name;
            objUpDoc.doc_bio = _doc_bio;
            objUpDoc.doc_img = _doc_img;
            objDoc.SubmitChanges();
            return true;
        }
    }

    //deletes record from DB where ID matches
    public bool commitDelete(int _doc_id)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        using (objDoc)
        {
            var objDelDoc = objDoc.doctors.Single(x => x.doc_id == _doc_id);
            objDoc.doctors.DeleteOnSubmit(objDelDoc);
            objDoc.SubmitChanges();
            return true;
        }
    }
}