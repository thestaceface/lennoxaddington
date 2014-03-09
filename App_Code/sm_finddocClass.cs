﻿using System;
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
    public IQueryable<doctor> getDocByDepID(int _doc_dept)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        var allDoctors = objDoc.doctors.Where(x => x.doc_dept == _doc_dept).Select(x => x);
        return allDoctors;
    }

    public bool commitInsert(string _doc_name, string _doc_bio, string _doc_img, int _doc_dept)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        using (objDoc)
        {
            var objNewDoc = new doctor();
            objNewDoc.doc_name = _doc_name;
            objNewDoc.doc_bio = _doc_bio;
            objNewDoc.doc_img = _doc_img;
            objNewDoc.doc_dept = _doc_dept;
            objDoc.doctors.InsertOnSubmit(objNewDoc);
            objDoc.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _doc_id, string _doc_name, string _doc_bio, string _doc_img, int _doc_dept)
    {
        lennoxdbDataContext objDoc = new lennoxdbDataContext();
        using (objDoc)
        {
            var objUpDoc = objDoc.doctors.Single(x => x.doc_id == _doc_id);
            objUpDoc.doc_name = _doc_name;
            objUpDoc.doc_bio = _doc_bio;
            objUpDoc.doc_img = _doc_img;
            objUpDoc.doc_dept = _doc_dept;
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