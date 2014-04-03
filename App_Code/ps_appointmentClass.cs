using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ps_appointmentClass
{
    public IQueryable<department> getDepartment()
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        var allDepts = objDep.departments.Select(x => x);
        return allDepts;

    }
    public IQueryable<doctor> getDoctors()
    {
        lennoxdbDataContext objEmp = new lennoxdbDataContext();
        var allEmp = objEmp.doctors.Select(x => x); ;
        return allEmp;
    }

   
    //public IQueryable<appointment> getBookedAppointments(int _id, DateTime _dt)
    //{
    //    lennoxdbDataContext objAppmnt = new lennoxdbDataContext();
    //    //var avapp =  objAppmnt.appointments.Where
                        
    //}

    public IQueryable<appointment> getAppointmentByID(int _id)
    {
        lennoxdbDataContext objAppmnt = new lennoxdbDataContext();
        var allAppmnts = objAppmnt.appointments.Where(x => x.at_id == _id).Select(x => x);
        return allAppmnts;
    }

    public bool commitInsert(string _name, int _cardno, string _dept, string _doc, DateTime _date, string _reason)
    {
        lennoxdbDataContext objAppmnt = new lennoxdbDataContext();
        using (objAppmnt)
        {
            appointment objApp = new appointment();
            objApp.pat_name = _name;
            objApp.at_p_id = _cardno;
            objApp.at_clinic = _dept;
            objApp.at_doc_name = _doc;
            objApp.at_date = _date;
            objApp.at_reason = _reason;
            objAppmnt.appointments.InsertOnSubmit(objApp);
            objAppmnt.SubmitChanges();           
            return true;

        }
    }
    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objApp = new lennoxdbDataContext();
        using (objApp)
        {
            var objDelApp = objApp.appointments.Single(x => x.at_id == _id);
            objApp.appointments.DeleteOnSubmit(objDelApp);
            objApp.SubmitChanges();
            return true;
        }
    }
}