using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for faqclass
/// </summary>

public class faqclass
{
    public IQueryable<faqanswer> getAllData()
    {
        lennoxdbDataContext faqObj = new lennoxdbDataContext();
        var allData = faqObj.faqanswers.Select(x => x);
        return allData; 
    }

    public string commitUpdate(int _id, string _fa_category, string _fa_question, string _fa_answer)
    {
        lennoxdbDataContext faqObjU = new lennoxdbDataContext();
        using (faqObjU)
        {
            var objUpFaq = faqObjU.faqanswers.Single(x => x.fa_id == _id);
            objUpFaq.fa_category = _fa_category;
            objUpFaq.fa_question = _fa_question;
            objUpFaq.fa_answer = _fa_answer;
            faqObjU.SubmitChanges();
            return "Your update was successful";
        }
    }

    public string commitInsert(string _fa_category, string _fa_question, string _fa_answer)
    {
        lennoxdbDataContext faqObjI = new lennoxdbDataContext();
        using (faqObjI)
        {
            var objInsertFaq = new faqanswer();
            objInsertFaq.fa_category = _fa_category;
            objInsertFaq.fa_question = _fa_question;
            objInsertFaq.fa_answer = _fa_answer;
            faqObjI.faqanswers.InsertOnSubmit(objInsertFaq);
            faqObjI.SubmitChanges();
            return "Your message was sent successfully";
        }

    }

    public string commitDelete(int _id)
    {
        lennoxdbDataContext faqObjD = new lennoxdbDataContext();
        using (faqObjD)
        {
            var objDelFaq = faqObjD.faqanswers.Single(x => x.fa_id == _id);
            faqObjD.faqanswers.DeleteOnSubmit(objDelFaq);
            faqObjD.SubmitChanges();
            return "Your delete was successful";
        }
    }
}

