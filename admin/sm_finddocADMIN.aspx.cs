using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class sm_finddocADMIN : System.Web.UI.Page
{
    sm_finddocClass Doc = new sm_finddocClass();
    
    //opens form to create new record
    protected void subCreate(object sender, EventArgs e)
    {
        _panelControl(pnl_new);
        msg.Text = string.Empty;
        lbl_filename.Text = string.Empty;
        lbl_upstatus.Text = string.Empty;
    }

    //resets all fields on page (re)load
    private void _subRebind()
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        txt_name.Text = string.Empty;
        txt_bio.Text = string.Empty;
        rpt_select.DataSource = Doc.getDoctors();
        rpt_select.DataBind();
    }

    //calls reset
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    //handles file upload
    //tutorial: http://asp.net-tutorials.com/controls/file-upload-control/
    protected void subUpload(object sender, EventArgs e)
    {
        //checks if file has been attached
        if (flu_doc.HasFile)
        {
            try
            {   
                //checks for allowable file type: jpg
                if (flu_doc.PostedFile.ContentType == "image/jpeg")
                {
                    //checks that file is less than 100kb
                    if (flu_doc.PostedFile.ContentLength < 102400)
                    {
                        //tells control where to put file, places filepath into string to be sent to DB
                        string filename = Path.GetFileName(flu_doc.FileName);
                        flu_doc.SaveAs(Server.MapPath("~/Images/") + filename);
                        lbl_upstatus.Text = "Upload complete";
                        lbl_filename.Text += "Images/" + filename;
                    }
                    else
                    {
                        //thrown when file too large
                        lbl_upstatus.Text = "<p style='color:red;'>File must be less than 100kb</p>";
                    }
                }
                else 
                {
                    lbl_upstatus.Text = "<p style='color:red;'>File must be .jpg format</p>";
                }
            }
            catch (Exception ex)
            {
                //thrown when any other error occurs
                lbl_upstatus.Text = "<p style='color:red;'>File could not be uploaded. The following error occured: " + ex.Message + "</p>";
            }
        }
    }

    //returns a success//failure message when committing to DB
    private void _strMessage(bool flag, string str)
    {
        if (flag) {
            msg.Text = str + " record: <span style='color:green;'>Successful</span>";
        }
        else {
            msg.Text = str + " record: <span style='color:red;'>Failed</span>";
        }
    }

    //handles button commands - if insert executes the insert and calls the _strMessage function, if update calls the _showUpdate function, if cancel, calls reset
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Insert":
                _strMessage(Doc.commitInsert(txt_name.Text, txt_bio.Text, lbl_filename.Text), "Insert");
                _subRebind();
                break;
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    //shows update form panel
    private void _showUpdate(int id)
    {
        _panelControl(pnl_edit);
        msg.Text = string.Empty;
        sm_finddocClass Doc = new sm_finddocClass();
        rpt_edit.DataSource = Doc.getDoctorByID(id);
        rpt_edit.DataBind();
    }

    //controls panel visibility
    private void _panelControl(Panel pnl)
    {
        pnl_new.Visible = false;
        pnl_edit.Visible = false;
        pnl.Visible = true;
    }

    //called in update form - case update commits update and calls _strMessage function, delete deletes record and calls _strMessage. cancel calls reset
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "UpdateFile":
                FileUpload updateFile = (FileUpload)e.Item.FindControl("flu_docE");
                Label updateStatus = (Label)e.Item.FindControl("lbl_upstatusE");
                if (updateFile.HasFile)
                {
                    try
                    {
                        //checks if file is allowable type: jpg
                        if (updateFile.PostedFile.ContentType == "image/jpeg")
                        {
                            //checks if file is less than 100kb
                            if (updateFile.PostedFile.ContentLength < 102400)
                            {
                                //instructs control where to put file, places filepath into string to be sent to DB
                                string filename = Path.GetFileName(updateFile.FileName);
                                updateFile.SaveAs(Server.MapPath("~/Images/") + filename);
                                Label file = (Label)e.Item.FindControl("lbl_file");
                                updateStatus.Text = "Upload complete";
                                file.Text = "Images/" + filename;

                            }
                            else
                            {
                                //thrown if image too large
                                updateStatus.Text = "<p style='color:red;'>File must be less than 100kb</p>";
                            }
                        }
                        else
                        {
                            updateStatus.Text = "<p style='color:red;'>File must be .jpg format</p>";
                        }
                    }
                    catch (Exception ex)
                    {
                        //thrown for any other error
                        updateStatus.Text = "<p style='color:red;'>File could not be uploaded. The following error occured: " + ex.Message + "</p>";
                    }
                }
                break;

            case "Update":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtBio = (TextBox)e.Item.FindControl("txt_bioE");
                Label lblFile = (Label)e.Item.FindControl("lbl_file");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int docID = int.Parse(hdfID.Value.ToString());
                //try lblFile.filename 
                _strMessage(Doc.commitUpdate(docID, txtName.Text, txtBio.Text, lblFile.Text), "Update");
                _subRebind();
                break;
            case "Delete":
                int _doc_id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(Doc.commitDelete(_doc_id), "Delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
            case "EditImage":
                    try
                    {
                        if (flu_doc.PostedFile.ContentType == "image/jpeg")
                        {
                            if (flu_doc.PostedFile.ContentLength < 102400)
                            {
                                string filename = Path.GetFileName(flu_doc.FileName);
                                flu_doc.SaveAs(Server.MapPath("~/Images/") + filename);
                                lbl_upstatus.Text = "Upload complete";
                                lbl_filename.Text += "Images/" + filename;
                            }
                            else
                            {
                                lbl_upstatus.Text = "File must be less than 100kb";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lbl_upstatus.Text = "File could not be uploaded. The following error occured: " + ex.Message;
                    }
                break;





        }
    }
}