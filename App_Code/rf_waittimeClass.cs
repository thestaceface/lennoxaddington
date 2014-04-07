using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class rf_sysinfoClass
{
    public IQueryable<sysinfo> getsysinfos()
    {
        lennoxdbDataContext objsysinfo = new lennoxdbDataContext();
        var allsysinfos = objsysinfo.sysinfos.Select(x => x);
        return allsysinfos;
    }

    public IQueryable<sysinfo> getsysinfoByID(int _id)
    {
        lennoxdbDataContext objWT = new lennoxdbDataContext();
        var allsysinfos = objWT.sysinfos.Where(x => x.si_id == _id).Select(x => x);
        return allsysinfos;
    }

    public bool commitInsert(string _si_desc, Int32 _si_numdoctor, Int32 _si_avgtime, Int32 _si_numregistered, Int32 _si_numattended, DateTime _si_today, Int32 _waittime, Int32 _si_numwaiting, Int32 _si_d_id, DateTime _si_lupdate, string _si_message, Int32 _si_updateby) 
    {
        lennoxdbDataContext objWT = new lennoxdbDataContext();
        using (objWT)
        {
            var objNewWT = new sysinfo();
            objNewWT.si_desc = _si_desc;
            objNewWT.si_numdoctor = _si_numdoctor;
            objNewWT.si_avgtime = _si_avgtime;
            objNewWT.si_numregistered = _si_numregistered;
            objNewWT.si_numattended = _si_numattended;
            objNewWT.si_today = _si_today;
            objNewWT.si_waittime = _waittime;
            objNewWT.si_numwaiting = _si_numwaiting;
            objNewWT.si_d_id = _si_d_id;
            objNewWT.si_lupdate = _si_lupdate;
            objNewWT.si_message = _si_message;
            objNewWT.si_updateby = _si_updateby;
            objWT.sysinfos.InsertOnSubmit(objNewWT);
            objWT.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _si_id, string _si_desc, Int32 _si_numdoctor, Int32 _si_avgtime, Int32 _si_numregistered, Int32 _si_numattended, DateTime _si_today, Int32 _waittime, Int32 _si_numwaiting, Int32 _si_d_id, DateTime _si_lupdate, string _si_message, Int32 _si_updateby)
    {
        lennoxdbDataContext objWT = new lennoxdbDataContext();
        using (objWT)
        {
            var objUpWT = objWT.sysinfos.Single(x => x.si_id == _si_id);
            objUpWT.si_desc = _si_desc;
            objUpWT.si_numdoctor = _si_numdoctor;
            objUpWT.si_avgtime = _si_avgtime;
            objUpWT.si_numregistered = _si_numregistered;
            objUpWT.si_numattended = _si_numattended;
            objUpWT.si_today = _si_today;
            objUpWT.si_waittime = _waittime;
            objUpWT.si_numwaiting = _si_numwaiting;
            objUpWT.si_d_id = _si_d_id;
            objUpWT.si_lupdate = _si_lupdate;
            objUpWT.si_message = _si_message;
            objUpWT.si_updateby = _si_updateby;
            objWT.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _si_id)
    {
        lennoxdbDataContext objWT = new lennoxdbDataContext();
        using (objWT)
        {
            var objDelWT = objWT.sysinfos.Single(x => x.si_id == _si_id);
            objWT.sysinfos.DeleteOnSubmit(objDelWT);
            objWT.SubmitChanges();
            return true;
        }
    }
}