using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ps_SlideImages : System.Web.UI.Page
{
    ps_sliderImage objImage = new ps_sliderImage();

    //makes panel visible for creating new record
    protected void subCreate(object sender, EventArgs e)
    {
        pnl_new.Visible = true;
        pnl_update.Visible = false;
        lbl_msg.Text = string.Empty;
    }

    //calls page reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }

    }

    //resets fields on page reload
    private void _subRebind()
    {
        txt_nameI.Text = string.Empty;
        txt_descI.Text = string.Empty;
        txt_pathI.Text = string.Empty;
        dtl_all.DataSource = objImage.getImages();
        dtl_all.DataBind();
        _panelControl(pnl_all);
        //lbl_msg.Text = string.Empty;

    }

    //handles button commands - if insert, executes the insert and calls the _strMessage function, if update calls the _showUpdate function & if cancel, calls reset
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

    //to ensure the directory exists
    public void EnsureDirectoriesExist()
    {

        // if the  directory doesn't exist - create it. 
        if (!System.IO.Directory.Exists(Server.MapPath(@"~/Images/")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(@"~/Images/"));
        }

    }

    //to acually insert a new image
    protected void Add(object sender, EventArgs e)  
	{
        if (fileupload1.HasFile && Path.GetExtension(fileupload1.FileName) == ".png" || Path.GetExtension(fileupload1.FileName) == ".gif" )
        {
            // create posted file
            //  to ensure  a place for the file in the directory structure
            EnsureDirectoriesExist();
            String filePath = Server.MapPath(@"~/Images/" + fileupload1.FileName);
            fileupload1.SaveAs(filePath);
        }
        else
        {
            lbl_msg.Text = "Please select a .png or .gif file";
        }

	}

    //called in update form - case update commits update and calls _strMessage function, delete deletes record and calls _strMessage. cancel calls reset
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

    //called by subAdmin - makes edit panel and form visible
    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        ps_sliderImage _img = new ps_sliderImage();
        dtl_update.DataSource = _img.getImageByID(id);
        dtl_update.DataBind();
    }

    //called by subAdmin - makes delete panel and form visible and asks for confirmation
    private void _showDelete(int id)
    {
        _panelControl(pnl_delete);
        dtl_delete.DataSource = objImage.getImageByID(id);
        dtl_delete.DataBind();
    }

    //controls panel visibility
    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_new.Visible = false;
        pnl_delete.Visible = false;
        pnl_update.Visible = false;       
        pnl.Visible = true;
    }

    //returns a message notifying user of success or failure committing changes to DB
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        lbl_msg.Text= "Image" + "  " + str + " was successful!";
        else
        lbl_msg.Text = "Sorry,unable to" + str + "image";
    }
}