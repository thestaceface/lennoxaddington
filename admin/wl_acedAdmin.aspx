<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wl_acedAdmin.aspx.cs" Inherits="admin_wl_acedAdmin" MasterPageFile="~/mainMaster.master" Debug="true" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <h1><asp:Label ID="lbl_header" runat="server" Text="Page Administration" /></h1>

    <%-- -----------------Default Panel Begin----------------- --%>
    <asp:Panel ID="pnl_main" runat="server" Visible="true" >
        <h2>Add A New Page</h2>
        <p>To add a new page, please select the "Add a Page" button and then choose a section page from the list on the right.  Your new page will be created in the selected section.</p>

        <h2>Edit An Existing Page</h2>
        <p>To edit an existing page, select the "Edit a Page" button and then please select the page you wish to edit from the navigation tree on the right panel. Click on the "Edit" button to open the editing window.</p>

        <%--<h2>Copy An Existing Page</h2>
        <p>To copy an existing page, please select the page you wish to copy from the navigation tree on the right panel and then click on the "Copy Page" button in the panel to the right.</p>--%>

        <h2>Delete an existing page</h2>
        <p>To delete an existing page, select the "Delete a Page" button and then please select the page you wish to delete from the navigation tree on the right plane.  Click on the "Delete Page" button to permanently delete the page.</p>
    </asp:Panel>

    <br /><hr /><br />

    <%-- -----------------Default Panel End----------------- --%>

    <asp:Label ID="lbl" runat="server" />

    <%-- -----------------ADD Panel Begin----------------- --%>
    <asp:Panel ID="pnl_insert" runat="server" Visible="false">
        <h2>Add A Page</h2>

        <asp:Label ID="lbl_pagenameI" runat="server" Text="Enter Page Name" /> <br />
        <asp:TextBox ID="txt_pagenameI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*" ControlToValidate="txt_pagenameI" ValidationGroup="insert" ErrorMessage="Please insert a name" /><br />
            
        <asp:Label ID="lbl_contentI" runat="server" Text="Enter Page Content" />
        <CKEditor:CKEditorControl ID="cke_contentI" runat="server" BasePath="~/ckeditor/" ></CKEditor:CKEditorControl>
        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*" ControlToValidate="cke_contentI" ValidationGroup="insert" ErrorMessage="Please insert content" /><br />

<%--        <asp:Label ID="lbl_urlI" runat="server" Text="Enter Page URL" />
        <asp:TextBox ID="txt_urlI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_urlI" runat="server" Text="*" ControlToValidate="txt_urlI" ValidationGroup="insert" ErrorMessage="Please insert a url" /><br />

        <asp:Label ID="lbl_titleI" runat="server" Text="Enter Page Title" /> <br />
        <asp:TextBox ID="txt_titleI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv" runat="server" Text="*" ControlToValidate="txt_titleI" ValidationGroup="insert" ErrorMessage="Please insert a title" /><br />--%>

        <asp:Button ID="btn_insert" runat="server" Text="Insert" onClick="subInsert" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="subCancel" CausesValidation="false" />
    </asp:Panel>
        

    <%-- -----------------EDIT Panel Begin----------------- --%>
    
    <asp:Panel ID="pnl_edit" runat="server" Visible="false">
        <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subAdmin">   
            <ItemTemplate>
                <asp:Hiddenfield ID="hdf_idE" runat="server" Value='<%#Eval("cp_id") %>' /><br />

                <asp:Label ID="lbl_pagenameE" runat="server" Text="Page Title" />
                <asp:TextBox ID="txt_pagenameE" runat="server" text='<%#Bind("cp_pagename") %>' />
                <asp:RequiredFieldValidator ID="rfv_pagenameE" runat="server" Text="*" ControlToValidate="txt_pagenameE" ValidationGroup="edit" ErrorMessage="Please insert a product name" />
                <br />
            
                <asp:Label ID="lbl_contentE" runat="server" Text="Enter Page Content" />
                <CKEditor:CKEditorControl ID="cke_contentE" runat="server" BasePath="~/ckeditor/" text='<%#Bind("cp_content") %>'  ></CKEditor:CKEditorControl>
                <asp:RequiredFieldValidator ID="rfv_contentE" runat="server" Text="*" ControlToValidate="cke_contentE" ValidationGroup="edit" ErrorMessage="Please insert a description" />

                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update_This" ValidationGroup="edit" />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel_This" CausesValidation="false" />
                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" />           
            </ItemTemplate> 
        </asp:Repeater>

    </asp:Panel>
    
    <br /><hr /><br />

    <%-- -----------------ADD SELECT PANEL Begin----------------- --%>

        



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
    <asp:Panel ID="pnl_choose" runat="server" Visible="true" >
        <br />
        <asp:Button runat="server" ID="choose_add" Text="Add A Page" OnClick="openAdd" />
        <asp:Button runat="server" ID="choose_edit" Text="Edit a Page" OnClick="openEdit" />
        <asp:Button runat="server" ID="choose_delete" Text="Delete a Page" OnClick="openEdit" />


    </asp:Panel>
    
    
    <asp:Panel ID="pnl_pagelist" runat="server" Visible="false">
        <h2>Page Listing</h2>
        <asp:Repeater ID="rpt_pagelist" runat="server" >

            <ItemTemplate>
                <table>
                    <tr runat="server" id="row">
                        <td>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("cp_id") %>' />
                            <asp:Linkbutton ID="lkb_pagename" runat="server" Text='<%#Eval("cp_pagename") %>' CommandName="Select" OnCommand="subSelect" CommandArgument='<%#Eval("cp_id") %>'  />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            
        </asp:Repeater>
        <asp:Button runat="server" ID="btn_showEdit" OnClick="subShowEdit" Text="Edit Selected Page" Visible="false" />
        <asp:Button runat="server" ID="btn_showDelete" OnClick="subShowEdit" Text="Delete Selected Page" Visible="false" />
        <asp:Button runat="server" ID="btn_showInsert" OnClick="subShowInsert" Text="Add A New Page" Visible="true" />

        <asp:Button runat="server" ID="btn_listcancel" OnClick="subCancel" Text="Cancel" Visible="true" />
    </asp:Panel>
</asp:Content>
