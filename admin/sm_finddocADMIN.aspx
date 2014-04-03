<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_finddocADMIN.aspx.cs" Inherits="sm_finddocADMIN" Debug="true" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Label ID="lbl_title" runat="server" Text="Edit Page - Find a Doctor" CssClass="admintitle" />
    <br /><br />

    <%-- page instructions --%>
    <asp:Label ID="lbl_page" runat="server" Text="Select a doctor's name from the menu on the right to edit an existing record, or " />
    <asp:LinkButton ID="lnk_create" runat="server" Text="create a new record." OnClick="subCreate" />
    <br /><br /><hr /><br />

    <%-- success/failure message goes here --%>
    <asp:Label ID="msg" runat="server" />
    <br />

    <%-- panel contains form to create new record --%>
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Record" Font-Underline="true" />
        <br /><br />
        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br /><br />
        <table class="tables">
            <tr>
                <td>
                    <asp:label ID="lbl_name" runat="server" Text="Doctor Name:*" AssociatedControlID="txt_name" />
                </td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_name" runat="server" ControlToValidate="txt_name" ErrorMessage="Name is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_bio" runat="server" Text="Bio:*" AssociatedControlID="txt_bio" />
                </td>
                <td>
                    <asp:TextBox ID="txt_bio" runat="server" TextMode="MultiLine" Columns="40" Rows="10" />
                    <asp:RequiredFieldValidator ID="rfv_bio" runat="server" ControlToValidate="txt_bio" ErrorMessage="Bio is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <%-- file upload --%>
                <td>
                    <asp:Label ID="lbl_img" runat="server" text="Image:" />
                </td>
                <td>
                    <asp:FileUpload ID="flu_doc" runat="server" />
                    <asp:Button ID="btn_upload" runat="server" Text="Upload" OnClick="subUpload" />
                    <br />
                    <asp:Label ID="lbl_filename" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lbl_upstatus" runat="server" />
                </td> 
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>    
                    <asp:Label ID="lbl_imgrules" runat="server" Text="(Max. upload: 100kb. Only .jpg allowed.)" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert Record" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="edit" CssClass="adminbuttons" />
        <%-- validation summary for insert group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>

    <%-- panel contains form to update existing records --%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <table class="tables">
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_nameE" runat="server" Text="Doctor Name:*" AssociatedControlID="txt_nameE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("doc_id") %>' />
                    <asp:TextBox ID="txt_nameE" runat="server" Text='<%#Bind ("doc_name") %>' /> 
                    <asp:RequiredFieldValidator ID="rfv_nameE" runat="server" ControlToValidate="txt_nameE" ErrorMessage="Name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_bioE" runat="server" Text="Bio:*" AssociatedControlID="txt_bioE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_bioE" runat="server" TextMode="MultiLine" Columns="40" Rows="10" Text='<%#Bind ("doc_bio") %>' />
                    <asp:RequiredFieldValidator ID="rfv_bioE" runat="server" ControlToValidate="txt_bioE" ErrorMessage="Bio is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <%-- file upload --%>
                <td>
                    <asp:Label ID="lbl_imgE" runat="server" text="Image:" />
                </td>
                <td>
                    <asp:FileUpload ID="flu_docE" runat="server" />
                    <asp:Button ID="btn_upload" runat="server" Text="Upload" CommandName="EditImage" CommandArgument='<%#Eval ("doc_id") %>' />
                    <br />
                    <asp:Label ID="lbl_filename" runat="server" Text='<%#Bind ("doc_img") %>' />
                    <br />
                    <br />
                    <asp:Label ID="lbl_upstatus" runat="server" />
                </td> 
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>    
                    <asp:Label ID="lbl_imgrulesE" runat="server" Text="(Max. upload: 100kb. Only .jpg allowed.)" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                    <%-- validation summary for edit group --%>
                    <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
            <br /><br />
    </asp:Panel>
</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cph_aside">
    <br />
    <asp:Label ID="lbl_select" runat="server" text="Doctors" CssClass="sidebarlbl" />
    <br /><br />

    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <%-- selecting item from sidebar opens form in update panel populated with selected record's data --%>
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("doc_name") %>' CommandName="Update" CommandArgument='<%#Eval ("doc_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br /><br />

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>



