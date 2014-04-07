using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for faqclass
/// </summary>
public class faqclass
{
    public IQueryable<faq> getAllData()
    {
        lennoxdbDataContext faqObj = new lennoxdbDataContext();
        var allData = faqObj.faqs.Select(x => x);
        return allData; 
    }

    public bool updateData(int _id, string _title, string _content)
    {
        lennoxdbDataContext faqObjU = new lennoxdbDataContext();
        using (faqObjU)
        {
            var objUpFaq = faqObjU.faqs.Single(x => x.Id == _id);
            objUpFaq.title = _title;
            objUpFaq.content = _content;
            faqObjU.SubmitChanges(); 
            return true;
        }
    }

    public bool insertData(string _title, string _content)
    {
        lennoxdbDataContext faqObjI = new lennoxdbDataContext();
        using (faqObjI)
        {
            var objInsertFaq = new faq();
            objInsertFaq.title = _title;
            objInsertFaq.content = _content;
            faqObjI.faqs.InsertOnSubmit(objInsertFaq);
            faqObjI.SubmitChanges();
            return true; 
        }

    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext faqObjD = new lennoxdbDataContext();
        using (faqObjD)
        {
            var objDelFaq = faqObjD.faqs.Single(x => x.Id == _id);
            faqObjD.faqs.DeleteOnSubmit(objDelFaq);
            faqObjD.SubmitChanges();
            return true;
        }
    }
}
