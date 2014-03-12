<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wl_acedAdmin.aspx.cs" Inherits="admin_wl_acedAdmin" MasterPageFile="~/mainMaster.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Label ID="lbl_header" runat="server" Text="Page Administration" CssClass="WL_Admin_H1" />

    <%-- -----------------Default Panel Begin----------------- --%>
    <asp:Panel ID="pnl_main" runat="server" Visible="true" >
        <h2>Add A New Page</h2>
        <p>To add a new page, please click on the "Add Page" button in the panel to the right.</p>

        <h2>Edit An Existing Page</h2>
        <p>To edit an existing page, please select the page you wish to edit from the navigation tree on the right panel and then click on the "Edit Page" button in the panel to the right.</p>

        <h2>Copy An Existing Page</h2>
        <p>To copy an existing page, please select the page you wish to copy from the navigation tree on the right panel and then click on the "Copy Page" button in the panel to the right.</p>

        <h2>Delete an existing page</h2>
        <p>To delete an existing page, please select the page you wish to delete from the navigation tree on the right plane and then click on the "Delete Page" button in the panel to the right.</p>
    </asp:Panel>

    <%-- -----------------Default Panel End----------------- --%>

    <%-- -----------------ADD Panel Begin----------------- --%>
    <asp:Panel ID="pnl_add" runat="server" Visible="false">
        <h2>Add A Page</h2>
        <%--<asp:Label ID="lbl_Title" runat="server" Text="Add A Page" />--%>
        <asp:Label ID="lbl_addTitle" runat="server" AssociatedControlID="txt_addTitle" Text="Title: " />
        <asp:TextBox ID="txt_addTitle" runat="server" />
        <br />
        <asp:Label ID ="lbl_addUrl" runat="server" AssociatedControlID="txt_addUrl" Text="URL: " />
        <asp:TextBox ID="txt_addURL" runat="server" />
        <br />
        <asp:Label ID="lbl_addContent" runat="server" AssociatedControlID="txt_addContent" Text="Content: " />
        <br />
        <asp:TextBox ID="txt_addContent" runat="server" TextMode="MultiLine" Columns="50" Rows="10"  />
        
        <ajax:ToolkitScriptManager ID="scm" runat="server" />

        <ajax:HtmlEditorExtender ID="hee" runat="server" TargetControlID="txt_addContent" >
            <Toolbar>
                <ajax:Undo /><ajax:Redo />
                <ajax:Bold /><ajax:Italic /><ajax:Underline />
                <ajax:StrikeThrough /><ajax:Subscript /><ajax:Superscript />
                <ajax:JustifyLeft /><ajax:JustifyCenter /><ajax:JustifyRight /><ajax:JustifyFull />
                <ajax:InsertOrderedList /><ajax:InsertUnorderedList />
                <ajax:CreateLink /><ajax:UnLink />
                <ajax:RemoveFormat />
                <ajax:SelectAll /><ajax:UnSelect />
                <ajax:Delete /><ajax:Cut /><ajax:Copy /><ajax:Paste />
<%--                <ajax:BackgroundColorSelector /><ajax:ForeColorSelector />
                <ajax:FontNameSelector /><ajax:FontSizeSelector />--%>
                <ajax:Indent /><ajax:Outdent />
                <ajax:InsertHorizontalRule /><ajax:HorizontalSeparator />
                <ajax:InsertImage />
            </Toolbar>
        </ajax:HtmlEditorExtender>
        <br />
        <asp:Button ID="btn_addSave" runat="server" Text="Save" />
        <asp:Button ID="btn_addCancel" runat="server" Text="Cancel" />


    </asp:Panel>

    <asp:Panel ID="pnl_copy" runat="server" Visible="false">

    </asp:Panel>

    <asp:Panel ID="pnl_edit" runat="server" Visible="false">

    </asp:Panel>

</asp:Content>

<%--<asp:Content ID="Content3" ContentPlaceHolderID="cph_sidebar" Runat="Server">
    
</asp:Content>--%>
