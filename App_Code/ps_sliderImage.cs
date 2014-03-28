using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ps_sliderImage
/// </summary>
public class ps_sliderImage
{
    public IQueryable<SlideImage> getImages()
    {
        lennoxdbDataContext objImg = new lennoxdbDataContext();
        var allImages = objImg.SlideImages.Select(x => x);
        return allImages;

    }

    public IQueryable<SlideImage> getImageByID(int _id)
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        var allImgs = objImgs.SlideImages.Where(x => x.sl_id == _id).Select(x => x);
        return allImgs;
    }

    public bool commitInsert(string _name, string _path)
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        using (objImgs)
        {
           SlideImage objNewImg = new SlideImage();
            objNewImg.sl_name = _name;
            objNewImg.sl_path = _path;
            objImgs.SlideImages.InsertOnSubmit(objNewImg);
            objImgs.SubmitChanges();
            return true;

        }
    }

    public bool commitUpdate(int _id, string _name )
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        using (objImgs)
        {
            var objUpImg = objImgs.SlideImages.Single(x => x.sl_id == _id);
            objUpImg.sl_name = _name;
           
            objImgs.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        using (objImgs)
        {
            var objDelImg = objImgs.SlideImages.Single(x => x.sl_id == _id);
            objImgs.SlideImages.DeleteOnSubmit(objDelImg);
            objImgs.SubmitChanges();
            return true;
        }
    }
}