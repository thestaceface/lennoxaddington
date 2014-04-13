<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="wl_crudEdit.aspx.cs" Inherits="admin_wl_crudEdit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %><%--register CKEditor for use for main content--%>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <h2>Edit A Page</h2>
    <asp:Label ID="lbl_result" runat="server" ForeColor="Green" />
    <br />
    <asp:Panel ID="pnl_pagelist" runat="server">
    <h2>FAQ</h2>
        <br />
        <h3>Please select the page you wish to edit</h3>
        <br />
    <asp:Repeater ID="rpt_pagelist" runat="server" >
        <HeaderTemplate>
            <table>
            <thead>
                <td>Page Title</td>
                <td>Section</td>
            </thead>
        </HeaderTemplate>
        <ItemTemplate>

            <tr runat="server" id="row">
                <td>
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("cp_id") %>' />
                    <asp:Linkbutton ID="lkb_pagename" runat="server" Text='<%#Eval("cp_pagename") %>' CommandName="Select" OnCommand="subSelect" CommandArgument='<%#Eval("cp_id") %>'  />
                </td>

                <td>
                    
                    <asp:HiddenField ID="hdf_section" runat="server" Value='<%#Eval("cp_secid") %>' />
                    <asp:Label ID="lbl_section_name" runat="server" Text='<%#Eval("sp_name") %>' />
                </td>
            </tr>
            
        </ItemTemplate>
        <FooterTemplate>
            </table>

        </FooterTemplate>
    </asp:Repeater>
    </asp:Panel>
    

    <asp:Button runat="server" ID="btn_edit" Visible="false" Text="Retrieve selected page for update or delete" OnClick="subEdit"  />
    <asp:Button runat="server" ID="btn_return" Visible="true" Text="Return to Admin Page" PostBackUrl="~/admin/wl_crudMain.aspx" />



<asp:Panel ID="pnl_edit" runat="server" Visible="false">
    <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subAdmin" OnItemDataBound="repeaterDDL">   
    <%--<asp:Repeater ID="rpd_edit" runat="server">--%>  
        <ItemTemplate>
            <asp:Hiddenfield ID="hdf_idE" runat="server" Value='<%#Eval("cp_id") %>' /><br />

            <asp:Label ID="lbl_pagenameE" runat="server" Text="Page Title" />
            <asp:TextBox ID="txt_pagenameE" runat="server" Width="100%" text='<%#Bind("cp_pagename") %>' />
            <asp:RequiredFieldValidator ID="rfv_pagenameE" runat="server" Text="*" ControlToValidate="txt_pagenameE" ValidationGroup="edit" ErrorMessage="Please insert a product name" />
            <br />
            
            <asp:Label ID="lbl_sectionE" runat="server" Text="Select the section this page will exist under" /><br />
            <asp:HiddenField ID="hdf_secIDE" runat="server" Value='<%#Eval("cp_secid") %>' />
            <asp:DropDownList ID="ddl_sectionE" runat="server" /><br /><br />
            
            <asp:Label ID="lbl_contentE" runat="server" Text="Enter Page Content" />
            <CKEditor:CKEditorControl ID="cke_contentE" runat="server" BasePath="~/ckeditor/" text='<%#Bind("cp_content") %>'  ></CKEditor:CKEditorControl>
            <asp:RequiredFieldValidator ID="rfv_contentE" runat="server" Text="*" ControlToValidate="cke_contentE" ValidationGroup="edit" ErrorMessage="Please insert a description" />

            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update_This" ValidationGroup="edit" />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel_This" CausesValidation="false" />
            <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete_This" OnClientClick="return confirm('Confirm delete?');" />          
        </ItemTemplate> 
    </asp:Repeater>
</asp:Panel>


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">

</asp:Content>


