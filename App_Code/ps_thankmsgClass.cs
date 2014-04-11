using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Code by Puneet Saini
public class ps_thankmsgClass
{
    //gets all the departments in the hospital
    public IQueryable<department> getDepartment()
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        var allDepts = objDep.departments.Select(x => x);
        return allDepts;

    }
    //gets doctors based on an ID parameter
    public IQueryable<doctor> getDoctors()
    {
        lennoxdbDataContext objEmp = new lennoxdbDataContext();
        var allEmp = objEmp.doctors.Select(x => x); ;
        return allEmp;
    }
    //gets all the thank messages
    //public IQueryable<Thank_Msg> getMsgs()
    //{
    //    lennoxdbDataContext objMsg = new lennoxdbDataContext();
    //    var allMsgs = objMsg.Thank_Msgs.Select(x => x);
    //    return allMsgs;

    //}
    ////gets the thank messages based on an ID parameter
    //public IQueryable<Thank_Msg> getMsgByID(int th_id)
    //{
    //    lennoxdbDataContext objMsg = new lennoxdbDataContext();
    //    var allMsgs = objMsg.Thank_Msgs.Where(x => x.th_id == th_id).Select(x => x);
    //    return allMsgs;

    //}
    ////inserts values to DB
    //public bool commitInsert(DateTime _date, string _name, string _eml, string _dept, string _smname, string _msg)
    //{
    //    lennoxdbDataContext objMsg = new lennoxdbDataContext();
    //    using (objMsg)
    //    {
    //        Thank_Msg objNewMsg = new Thank_Msg();
    //        objNewMsg.th_date = _date;
    //        objNewMsg.th_name = _name;
    //        objNewMsg.th_eml = _eml;
    //        objNewMsg.th_dept = _dept;
    //        objNewMsg.th_smname = _smname;
    //        objNewMsg.th_msg = _msg;
    //        objMsg.Thank_Msgs.InsertOnSubmit(objNewMsg);
    //        objMsg.SubmitChanges();
    //        return true;

    //    }
    //}
    ////updates values in DB where IDs match
    //public bool commitUpdate(int _id, DateTime _date, string _name, string _eml,  string _msg)
    //{
    //    lennoxdbDataContext objMsg = new lennoxdbDataContext();
    //    using (objMsg)
    //    {
    //        var objUpMsg = objMsg.Thank_Msgs.Single(x => x.th_id == _id);
    //        objUpMsg.th_date = _date;
    //        objUpMsg.th_name = _name;
    //        objUpMsg.th_eml = _eml;          
    //        objUpMsg.th_msg = _msg;
    //        objMsg.SubmitChanges();
    //        return true;
    //    }
    //}
    ////deletes image from DB where IDs match
    //public bool commitDelete(int _th_id)
    //{
    //    lennoxdbDataContext objMsg = new lennoxdbDataContext();
    //    using (objMsg)
    //    {
    //        var objDelMsg = objMsg.Thank_Msgs.Single(x => x.th_id == _th_id);
    //        objMsg.Thank_Msgs.DeleteOnSubmit(objDelMsg);
    //        objMsg.SubmitChanges();
    //        return true;
    //    }
    //}

}