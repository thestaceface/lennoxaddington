using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Rezwanul Ferdous - 824-259-246

public class rf_feedbackClass
{
    //gets all Feedback records
    public IQueryable<feedback> getFeedbacks()
    {
        lennoxdbDataContext objFeedback = new lennoxdbDataContext();
        var allFeedbacks = objFeedback.feedbacks.Select(x => x);
        return allFeedbacks;
    }

    //gets feedback record based on an ID parameter
    public IQueryable<feedback> getFeedbackByID(int _id)
    {
        lennoxdbDataContext objFB = new lennoxdbDataContext();
        var oneFeedbacks = objFB.feedbacks.Where(x => x.fd_id == _id).Select(x => x);
        return oneFeedbacks;
    }

    //function to inserts values to Database
    public bool commitInsert(string _fd_category, string _fd_subject, string _fd_last, string _fd_first, string _fd_tel, string _fd_email, string _fd_street, string _fd_appt, string _fd_city, string _fd_province, string _fd_country, string _fd_message) 
    {
        lennoxdbDataContext objFB = new lennoxdbDataContext();
        using (objFB)
        {
            var objNewFB = new feedback();
            objNewFB.fd_category = _fd_category;
            objNewFB.fd_subject = _fd_subject;
            objNewFB.fd_last = _fd_last;
            objNewFB.fd_first = _fd_first;
            objNewFB.fd_tel = _fd_tel;
            objNewFB.fd_email = _fd_email;
            objNewFB.fd_street = _fd_street;
            objNewFB.fd_appt = _fd_appt;
            objNewFB.fd_city = _fd_city;
            objNewFB.fd_province = _fd_province;
            objNewFB.fd_country = _fd_country;
            objNewFB.fd_message = _fd_message;
            objNewFB.fd_selector = DateTime.Now.ToString() + " - " + _fd_subject + " by " + _fd_first + " " + _fd_last;
            objFB.feedbacks.InsertOnSubmit(objNewFB);
            objFB.SubmitChanges();
            return true;
        }
    }

    //function toupdates values in Database where admin selected ID matches
    public bool commitUpdate(int _fd_id, string _fd_category, string _fd_subject, string _fd_last, string _fd_first, string _fd_tel, string _fd_email, string _fd_street, string _fd_appt, string _fd_city, string _fd_province, string _fd_country, string _fd_message)
    {
        lennoxdbDataContext objFB = new lennoxdbDataContext();
        using (objFB)
        {
            var objUpFB = objFB.feedbacks.Single(x => x.fd_id == _fd_id);
            objUpFB.fd_category = _fd_category;
            objUpFB.fd_subject = _fd_subject;
            objUpFB.fd_last = _fd_last;
            objUpFB.fd_first = _fd_first;
            objUpFB.fd_tel = _fd_tel;
            objUpFB.fd_email = _fd_email;
            objUpFB.fd_street = _fd_street;
            objUpFB.fd_appt = _fd_appt;
            objUpFB.fd_city = _fd_city;
            objUpFB.fd_province = _fd_province;
            objUpFB.fd_country = _fd_country;
            objUpFB.fd_message = _fd_message;
            objFB.SubmitChanges();
            return true;
        }
    }

    //function to deletes record from Database where selected ID matches
    public bool commitDelete(int _fd_id)
    {
        lennoxdbDataContext objFB = new lennoxdbDataContext();
        using (objFB)
        {
            var objDelFB = objFB.feedbacks.Single(x => x.fd_id == _fd_id);
            objFB.feedbacks.DeleteOnSubmit(objDelFB);
            objFB.SubmitChanges();
            return true;
        }
    }
}