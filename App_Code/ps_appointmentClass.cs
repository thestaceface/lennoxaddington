using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


//Code by Puneet Saini
public class ps_appointmentClass
{
    //gets all the departments
    public IQueryable<department> getDepartment()
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        var allDepts = objDep.departments.Select(x => x);
        return allDepts;

    }
    public IQueryable<appointment> getAppointments()
    {
        lennoxdbDataContext objApp = new lennoxdbDataContext();
        var allAppmnts = objApp.appointments.Select(x => x);
        return allAppmnts;
    }

    //gets all the doctors
    public IQueryable<doctor> getDoctors()
    {
        lennoxdbDataContext objEmp = new lennoxdbDataContext();
        var allEmp = objEmp.doctors.Select(x => x); 
        return allEmp;
    }

    //gets all the booked appointments with date and time
    public IQueryable<appointment> getBookedAppointments(string dt, string time)
    {
        lennoxdbDataContext objApp = new lennoxdbDataContext();
        var allAppmnts = objApp.appointments.Where(x => x.at_date == dt && x.at_time == time).Select(x => x);
        return allAppmnts;
    }
    
    //gets the appointment based on an ID parameter
    public IQueryable<appointment> getAppointmentByID(int _id)
    {
        lennoxdbDataContext objAppmnt = new lennoxdbDataContext();
        var allAppmnts = objAppmnt.appointments.Where(x => x.at_id == _id).Select(x => x);
        return allAppmnts;
    }

    //inserts values to DB
    public bool commitInsert(string _name, string _cardno, string _dept, string _doc, string _date, string _time, string _reason)
    {
        lennoxdbDataContext objAppmnt = new lennoxdbDataContext();
        using (objAppmnt)
        {
            appointment objApp = new appointment();
            objApp.pat_name = _name;
            objApp.at_hcard = _cardno;
            objApp.at_clinic = _dept;
            objApp.at_doc_name = _doc;
            objApp.at_date = _date;
            objApp.at_time = _time;
            objApp.at_reason = _reason;
            objAppmnt.appointments.InsertOnSubmit(objApp);
            objAppmnt.SubmitChanges();           
            return true;

        }
    }

    //updates values to db
    public bool commitUpdate(int id, string patname, string hcard, string dept, string doc, string reason, string dt, string time)
    {
        lennoxdbDataContext obj = new lennoxdbDataContext();
        using (obj)
        {
            var objUp = obj.appointments.Single(x => x.at_id == id);
            objUp.pat_name = patname;
            objUp.at_hcard = hcard;
            objUp.at_clinic = dept;
            objUp.at_doc_name = doc;
            objUp.at_reason = reason;
            objUp.at_date = dt;
            objUp.at_time = time;
            obj.SubmitChanges();
            return true;
        }
    }

    //deletes appointment from DB where IDs match
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