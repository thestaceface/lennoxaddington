using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


//Code by Puneet Saini
public class ps_sliderImage
{
    //gets all slider images
    public IQueryable<SlideImage> getImages()
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        var allImages = objImgs.SlideImages.Select(x => x);
        return allImages;

    }

    //gets images based on an ID parameter
    public IQueryable<SlideImage> getImageByID(int _id)
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        var allImgs = objImgs.SlideImages.Where(x => x.sl_id == _id).Select(x => x);
        return allImgs;
    }

    //inserts values to DB
    public bool commitInsert(string _name, string _path, string _desc)
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        using (objImgs)
        {
           SlideImage objNewImg = new SlideImage();
            objNewImg.sl_name = _name;
            objNewImg.sl_path = _path;
            objNewImg.sl_desc = _desc;
            objImgs.SlideImages.InsertOnSubmit(objNewImg);
            objImgs.SubmitChanges();
            return true;

        }
    }

    //updates values in DB where IDs match
    public bool commitUpdate(int _id, string _name,string _desc )
    {
        lennoxdbDataContext objImgs = new lennoxdbDataContext();
        using (objImgs)
        {
            var objUpImg = objImgs.SlideImages.Single(x => x.sl_id == _id);
            objUpImg.sl_name = _name;
            objUpImg.sl_desc = _desc;
            objImgs.SubmitChanges();
            return true;
        }
    }

    //deletes image from DB where IDs match
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