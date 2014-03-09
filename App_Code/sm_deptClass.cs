using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class sm_deptClass
{
    public IQueryable<department> getDepts()
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        var allDepts = objDep.departments.Select(x => x);
        return allDepts;
    }

    public IQueryable<department> getDeptByID(int _dp_id)
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        var allDepts = objDep.departments.Where(x => x.dp_id == _dp_id).Select(x => x);
        return allDepts;
    }

    public bool commitInsert(string _dp_name, string _dp_head, string _dp_location)
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        using (objDep)
        {
            var objNewDep = new department();
            objNewDep.dp_name = _dp_name;
            objNewDep.dp_head = _dp_head;
            objNewDep.dp_location = _dp_location;
            objDep.departments.InsertOnSubmit(objNewDep);
            objDep.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _dp_id, string _dp_name, string _dp_head, string _dp_location)
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        using (objDep)
        {
            var objUpDep = objDep.departments.Single(x => x.dp_id == _dp_id);
            objUpDep.dp_name = _dp_name;
            objUpDep.dp_head = _dp_head;
            objUpDep.dp_location = _dp_location;
            objDep.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _dp_id)
    {
        lennoxdbDataContext objDep = new lennoxdbDataContext();
        using (objDep)
        {
            var objDelDep = objDep.departments.Single(x => x.dp_id == _dp_id);
            objDep.departments.DeleteOnSubmit(objDelDep);
            objDep.SubmitChanges();
            return true;
        }
    }
}