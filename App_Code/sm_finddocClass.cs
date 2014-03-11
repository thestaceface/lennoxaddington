using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class sm_finddocClass
{
    public IQueryable<doctor> getDoctors()
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.doctors.Select(x => x);
        return allDoctors;
    }

    public IQueryable<doctor> getDoctorByID(int _doc_id)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.doctors.Where(x => x.doc_id == _doc_id).Select(x => x);
        return allDoctors;
    }

    //queryable for getting just doctors
   /* public IQueryable<department> getDocByDepID(string _dp_name)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.departments.Where(x => x.dp_name.Join(objDoc.doctors.doc_dept).Select(x => x);
        return allDoctors;
    }*/

    /*public IQueryable<department> getDocByDepID(int _dp_id)
    {
        lennoxdbDataContext db = new lennoxdbDataContext();
        /*var query = db.departments.Join(db.doctors, dep => dep.dp_id, doc => doc.doc_dept, (dep, doc) => new { dep.dp_id, dep.dp_name });

        var dept = db.departments.Single(x => x.dp_id == db.doctors.doc_dept);
        
    }*/


    

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