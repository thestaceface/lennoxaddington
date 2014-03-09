using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class sm_eventClass
{
    public IQueryable<Event> getEvents()
    {
        lennoxdbDataContext objEvent = new lennoxdbDataContext();
        var allEvents = objEvent.Events.Select(x => x);
        return allEvents;
    }

    public IQueryable<Event> getEventsByID(int _id)
    {
        lennoxdbDataContext objEvent = new lennoxdbDataContext();
        var allEvents = objEvent.Events.Where(x => x.ev_id == _id).Select(x => x);
        return allEvents;
    }

    public bool commitInsert(string _ev_title, System.DateTime _ev_date, string _ev_desc, string _ev_media, string _ev_body)
    {
        lennoxdbDataContext objEvent = new lennoxdbDataContext();
        using (objEvent)
        {
            var objNewEv = new Event();
            objNewEv.ev_title = _ev_title;
            objNewEv.ev_date = _ev_date;
            objNewEv.ev_desc = _ev_desc;
            objNewEv.ev_media = _ev_media;
            objNewEv.ev_body = _ev_body;
            objEvent.Events.InsertOnSubmit(objNewEv);
            objEvent.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _ev_id, string _ev_title, System.DateTime _ev_date, string _ev_desc, string _ev_media, string _ev_body)
    {
        lennoxdbDataContext objEvent = new lennoxdbDataContext();
        using (objEvent)
        {
            var objUpEv = objEvent.Events.Single(x => x.ev_id == _ev_id);
            objUpEv.ev_title = _ev_title;
            objUpEv.ev_date = _ev_date;
            objUpEv.ev_desc = _ev_desc;
            objUpEv.ev_media = _ev_media;
            objUpEv.ev_body = _ev_body;
            objEvent.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _ev_id)
    {
        lennoxdbDataContext objEvent = new lennoxdbDataContext();
        using (objEvent)
        {
            var objDelEv = objEvent.Events.Single(x => x.ev_id == _ev_id);
            objEvent.Events.DeleteOnSubmit(objDelEv);
            objEvent.SubmitChanges();
            return true;
        }
    }

}