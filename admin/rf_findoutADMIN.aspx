<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="rf_findoutADMIN.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
    <br />
    <asp:Label ID="lbl_page" runat="server" Text="Select an External Link record from the menu on the right to edit an existing record, or " />
    <asp:LinkButton ID="lnk_select" runat="server" Text="create a new record." OnClick="subCreate" />
    <br />
    <br />
    <hr />
    <br />
    <asp:Label ID="msg" runat="server" />
    <br />
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <table class="tables">
            <tr>
                <td>
                    <asp:label ID="lbl_category" runat="server" Text="Category:*" AssociatedControlID="ddl_category" />
                </td>
                <td>
                    <asp:DropDownList ID="ddl_category" runat="server" Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_category" runat="server" ControlToValidate="ddl_category" ErrorMessage="Category is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_name" runat="server" Text="Link Name:*" AssociatedControlID="txt_name" />
                </td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" Columns="50" />
                    <asp:RequiredFieldValidator ID="rfvtxt_name" runat="server" ControlToValidate="txt_name" ErrorMessage="Link name is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_link" runat="server" Text="Link URL:*" AssociatedControlID="txt_link" />
                </td>
                <td>
                    <asp:TextBox ID="txt_link" runat="server" Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_link" runat="server" ControlToValidate="txt_link" ErrorMessage="Link URL is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert Record" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="edit" CssClass="adminbuttons" />
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>


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
                    <asp:label ID="lbl_ategoryE" runat="server" Text="Category:*" AssociatedControlID="txt_categoryE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("el_id") %>' />
                    <asp:TextBox ID="txt_categoryE" runat="server" Text='<%#Bind ("el_category") %>' Columns="50" /> 
                    <asp:RequiredFieldValidator ID="rfv_categoryE" runat="server" ControlToValidate="txt_categoryE" ErrorMessage="Category is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_nameE" runat="server" Text="Link Name:*" AssociatedControlID="txt_nameE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_nameE" runat="server" Text='<%#Bind ("el_name") %>' Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_nameE" runat="server" ControlToValidate="txt_nameE" ErrorMessage="Link name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_linkE" runat="server" Text="Link URL:*" AssociatedControlID="txt_linkE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_linkE" runat="server" Text='<%#Bind ("el_link") %>' Columns="50" />
                    <asp:RequiredFieldValidator ID="rfv_linkE" runat="server" ControlToValidate="txt_linkE" ErrorMessage="Link URL is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>                                
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
        </table>
            <br />
            <br />
    </asp:Panel>
</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="cph_aside">
    <asp:Label ID="lbl_select" runat="server" Text="Find Out More" CssClass="sidebarlbl" />
    <br />
    <br />
    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("el_name") %>' CommandName="Update" CommandArgument='<%#Eval ("el_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>  
</asp:Content>
