﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class cmspageClass
{
    public bool commitInsert(string _cp_pagename, string _cp_content) //method called commitInsert, which will grab a name, desc, price
    {//using a boolean here.  if it returns 1 or 0 for good bad.  also, since auto increment is on, don't need to add id.
        lennoxdbDataContext objPage = new lennoxdbDataContext(); //create an instance of linq.
        using (objPage)
        {
            contentpage objNewPage = new contentpage(); //here we're going to reference the dmbl file and the properties within it.
            // create a new object.  This will be the container for the new inserted item.
            objNewPage.cp_pagename = _cp_pagename; //name of obj is going to be the parameter.. 
            objNewPage.cp_content = _cp_content;
            objPage.contentpages.InsertOnSubmit(objNewPage);  //insertonsubmit and insertallonsubmit.  insertonsubmit adds just one row.  insertall adds multiple rows.  
            objPage.SubmitChanges();//this commits the changes to the database.  kinda like databind method.
            return true; //true because it's a boolean.
        }
    }

    public bool commitUpdate(int _cp_id, string _cp_pagename, string _cp_content)
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();
        using (objPage)
        {
            contentpage objUpdatePage = objPage.contentpages.Single(x => x.cp_id == _cp_id);
            objUpdatePage.cp_pagename = _cp_pagename;
            objUpdatePage.cp_content = _cp_content;

            objPage.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _cp_id)
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();
        using (objPage)
        {
            contentpage objDelPage = objPage.contentpages.Single(x => x.cp_id == _cp_id);
            objPage.contentpages.DeleteOnSubmit(objDelPage);
            objPage.SubmitChanges();
            return true;
        }
    }


    public IQueryable<contentpage> getPages() //IQueryable<table> getPages means that getPages will run a query through the list of <table>.  this will be used for populating lists.
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();//this is the instance of the linq object
        var allPages = objPage.contentpages.Select(x => x);// allPages is an anonymous variable that will hold the values of the query the database.  
        //objPage (using the linq object), products (take the database), Select (run a select) x => x, (for all values where x is x... all).  
        //above is the method syntax.  

        //below is the query syntax
        //var allPages = from x in objPage.contentpages select x; 
        return allPages;
    }

    public IQueryable<contentpage> getPageById(int _cp_id)
    {
        lennoxdbDataContext objPage = new lennoxdbDataContext();
        var onePage = objPage.contentpages.Where(x => x.cp_id == _cp_id).Select(x => x);
        return onePage;
    }


}