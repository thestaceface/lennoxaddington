using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{
    // link to class file
    positionClass objLinq = new positionClass();

    private void _subRebind()
    {
        rpt_all.DataSource = objLinq.getposition();
        rpt_all.DataBind();
        _panelControl(pnl_all);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(int.Parse(e.CommandArgument.ToString()));
                break;
        }
    }

    private void _showUpdate(int id)
    {
        _panelControl(pnl_update);
        positionClass _linq = new positionClass();
        rpt_update.DataSource = _linq.getProductByID(id);
        rpt_update.DataBind();
    }

    private void _panelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }


    //fileUpload1.saveAs(Server.MapPath("resume\\" + fileUpload1.FileName + ".docx"));
}