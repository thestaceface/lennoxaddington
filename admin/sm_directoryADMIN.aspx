﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_directoryADMIN.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
    <br />
    <asp:Label ID="lbl_page" runat="server" Text="Below you can choose to edit an existing contact record, or to create a new one." />
    <br />
    <asp:Button ID="btn_edit" runat="server" Text="Edit Existing Record" OnClick="subEdit" />
    <asp:Button ID="btn_create" runat="server" Text="Create a New Record" OnClick="subCreate" />
    <br />
    <br />
    <hr />
    <br />
    <asp:Label ID="msg" runat="server" />
    <br />
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Record" />
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:label ID="lbl_title" runat="server" Text="Contact Title:" AssociatedControlID="txt_title" />
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_title" ErrorMessage="Contact Title is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_type" runat="server" Text="Contact Type:" AssociatedControlID="txt_type" />
                </td>
                <td>
                    <asp:TextBox ID="txt_type" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_name" runat="server" Text="Contact Name:" AssociatedControlID="txt_name" />
                </td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_tel" runat="server" Text="Telephone:" AssociatedControlID="txt_tel" />
                </td>
                <td>
                    <asp:TextBox ID="txt_tel" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_tel" runat="server" ControlToValidate="txt_tel" ErrorMessage="Telephone is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_tel" runat="server" ControlToValidate="txt_tel" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_fax" runat="server" Text="Fax:" AssociatedControlID="txt_fax" />
                </td>
                <td>
                    <asp:TextBox ID="txt_fax" runat="server" />
                    <asp:RegularExpressionValidator ID="reg_fax" runat="server" ControlToValidate="txt_fax" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_email" runat="server" Text="Email:" AssociatedControlID="txt_email" />
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Email is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_loc" runat="server" text="Location:" AssociatedControlID="txt_loc" />
                </td>
                <td>
                    <asp:TextBox ID="txt_loc" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_loc" runat="server" ControlToValidate="txt_loc" ErrorMessage="Location is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert Record" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="edit" CssClass="adminbuttons" />
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>


    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" />
        <br />
        <br />
        <table>
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_titleE" runat="server" Text="Contact Title:" AssociatedControlID="txt_titleE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("of_id") %>' />
                    <asp:TextBox ID="txt_titleE" runat="server" Text='<%#Bind ("of_title") %>' /> 
                    <asp:RequiredFieldValidator ID="rfv_titleE" runat="server" ControlToValidate="txt_titleE" ErrorMessage="Contact Title is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_typeE" runat="server" Text="Contact Type:" AssociatedControlID="txt_typeE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_typeE" runat="server" Text='<%#Bind ("of_contacttype") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_nameE" runat="server" Text="Contact Name:" AssociatedControlID="txt_nameE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_nameE" runat="server" Text='<%#Bind ("of_contact") %>' />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_telE" runat="server" Text="Telephone:" AssociatedControlID="txt_telE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_telE" runat="server" Text='<%#Bind ("of_tel") %>' />
                    <asp:RequiredFieldValidator ID="rfv_telE" runat="server" ControlToValidate="txt_telE" ErrorMessage="Telephone is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_telE" runat="server" ControlToValidate="txt_telE" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_faxE" runat="server" Text="Fax:" AssociatedControlID="txt_faxE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_faxE" runat="server" Text='<%#Bind ("of_fax") %>' />
                    <asp:RegularExpressionValidator ID="reg_faxE" runat="server" ControlToValidate="txt_faxE" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_emailE" runat="server" Text="Email:" AssociatedControlID="txt_emailE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("of_email") %>' />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_locE" runat="server" text="Location:" AssociatedControlID="txt_locE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_locE" runat="server" Text='<%#Bind ("of_location") %>' />
                    <asp:RequiredFieldValidator ID="rfv_locE" runat="server" ControlToValidate="txt_locE" ErrorMessage="Location is required." Display="None" ValidationGroup="edit" />
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

