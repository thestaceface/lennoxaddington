using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    ps_sliderImage objImage = new ps_sliderImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }
    private void _subRebind()
    {
        txt_nameI.Text = string.Empty;
        txt_descI.Text = string.Empty;
        txt_pathI.Text = string.Empty;
        dtl_all.DataSource = objImage.getImages();
        dtl_all.DataBind();
        _panelControl(pnl_all);
        lbl_msg.Text = string.Empty;

    }
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objImage.commitInsert(txt_nameI.Text, txt_pathI.Text, txt_descI.Text), "insert");       
               _subRebind();
                break;

            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;

            case "Delete":
                _showDelete(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }
    public void EnsureDirectoriesExist()
    {

        // if the \pix directory doesn't exist - create it. 
        if (!System.IO.Directory.Exists(Server.MapPath(@"~/Images/")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(@"~/Images/"));
        }

    }

    protected void Click(object sender, EventArgs e)  
	{
        if (fileupload1.HasFile && Path.GetExtension(fileupload1.FileName) == ".png" || Path.GetExtension(fileupload1.FileName) == ".gif" )
        {
            // create posted file
            // make sure we have a place for the file in the directory structure
            EnsureDirectoriesExist();
            String filePath = Server.MapPath(@"~/Images/" + fileupload1.FileName);
            fileupload1.SaveAs(filePath);


        }
        else
        {
            lbl_msg.Text = "Please select a png or gif file";
        }

	}
     
    
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameU");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                HiddenField hdf_id = (HiddenField)e.Item.FindControl("hdf_idU");
                int id = int.Parse(hdf_id.Value.ToString());
                _strMessage(objImage.commitUpdate(id, txtName.Text,txtDesc.Text), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idD")).Value);
                _strMessage(objImage.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

                }
    }
   
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        ps_sliderImage _img = new ps_sliderImage();
        dtl_update.DataSource = _img.getImageByID(id);
        dtl_update.DataBind();
    }
    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        dtl_delete.DataSource = objImage.getImageByID(id);
        dtl_delete.DataBind();
    }
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;
        
        pnl.Visible = true;
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        lbl_msg.Text= "Image" + "  " + str + " was successful";
        else
        lbl_msg.Text = "Sorry,unable to" + str + "image";
    }
}