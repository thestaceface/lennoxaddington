<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="wl_crudAdd.aspx.cs" Inherits="admin_wl_crudAdd" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %><%--register CKEditor for use for main content--%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
<h2>Add A Page</h2>

    <asp:Label ID="lbl_result" runat="server" ForeColor="Green" /><%--shows success or failure on insert--%>
    <br />
    <asp:Button ID="btn_reload" runat="server" Text="Click Here To Refresh Navigation Menu" OnClick="_subReload" Visible="false" />

    <asp:Panel ID="pnl_add" runat="server"><%--disappears on successful add--%>

        <asp:Label ID="lbl_pagenameI" runat="server" Text="Enter Page Name" /> <br />
        <asp:TextBox ID="txt_pagenameI" runat="server" Width="100%" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_pagenameI" ValidationGroup="insert" ErrorMessage="Please insert a name" ForeColor="Red" /><br /><br />
        
        <asp:Label ID="lbl_sectionI" runat="server" Text="Select the section this page will exist under" /><br />
        <asp:DropDownList ID="ddl_sectionI" runat="server" /><br /><br />
            
        <asp:Label ID="lbl_contentI" runat="server" Text="Enter Page Content" />
        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="cke_contentI" ValidationGroup="insert" ErrorMessage="Please insert content" ForeColor="Red" />
        <CKEditor:CKEditorControl ID="cke_contentI" runat="server" BasePath="~/ckeditor/" ></CKEditor:CKEditorControl>
        <br />
        <%--this is saved for a later implementation phase--%>

        <%--        <asp:Label ID="lbl_urlI" runat="server" Text="Enter Page URL" />
        <asp:TextBox ID="txt_urlI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_urlI" runat="server" Text="*" ControlToValidate="txt_urlI" ValidationGroup="insert" ErrorMessage="Please insert a url" /><br />

        <asp:Label ID="lbl_titleI" runat="server" Text="Enter Page Title" /> <br />
        <asp:TextBox ID="txt_titleI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv" runat="server" Text="*" ControlToValidate="txt_titleI" ValidationGroup="insert" ErrorMessage="Please insert a title" /><br />--%>

        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnClick="subInsert" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel and return to Admin page" PostBackUrl="~/admin/wl_crudMain.aspx" CausesValidation="false" />
    </asp:Panel>

    <asp:Panel id="pnl_addMore" runat="server" Visible="false">
        <asp:Button ID="btn_addMore" runat="server" OnClick="subAddMore" Text="Add another page" />
        <asp:Button ID="btn_return" runat="server" PostBackUrl="~/admin/wl_crudMain.aspx" Text="Return to main administration page" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
</asp:Content>


