<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_eventsADMIN.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
    <br />
    <asp:Label ID="lbl_page" runat="server" Text="Below you can choose to edit an existing event, or to create a new one." />
    <br />
    <asp:Button ID="btn_edit" runat="server" Text="Edit Existing Event" OnClick="subEdit" />
    <asp:Button ID="btn_create" runat="server" Text="Create a New Event" OnClick="subCreate" />
    <br />
    <br />
    <hr />
    <br />
    <asp:Label ID="msg" runat="server" />
    <br />
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Event" />
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:label ID="lbl_title" runat="server" Text="Event Title:" AssociatedControlID="txt_title" />
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" Columns="30" />
                    <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_title" ErrorMessage="Title is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>   
            <tr>
                <td>
                     <asp:Label ID="lbl_date" runat="server" Text="Event Date:" AssociatedControlID="txt_date" />
                </td>
                <td>
                    <asp:TextBox ID="txt_date" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_date" runat="server" ControlToValidate="txt_date" ErrorMessage="Date is required." Display="None" ValidationGroup="insert" />
                    <asp:CompareValidator ID="cmv_date" runat="server" ControlToValidate="txt_date" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please use valid date format: dd/mm/yyyy" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label id="lbl_desc" runat="server" Text="Description:" AssociatedControlID="txt_desc" />
                </td>
                <td>
                    <asp:TextBox ID="txt_desc" runat="server" TextMode="MultiLine" Columns="40" Rows="10" />
                    <asp:RequiredFieldValidator ID="rfv_desc" runat="server" ControlToValidate="txt_desc" ErrorMessage="Description is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_img" runat="server" text="Image:" AssociatedControlID="txt_img" />
                </td>
                <td>
                    <asp:TextBox ID="txt_img" runat="server" />
                    <asp:Button ID="btn_upload" runat="server" Text="Upload" CausesValidation="false" ValidationGroup="insert" />
                </td> 
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>    
                    <asp:Label ID="lbl_imgrules" runat="server" Text="(Max. upload: 500kb. Only .jpg, .png, .gif allowed.)" />
                    <%-- validation needed for img upload --%>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Create" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="True" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>


    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Event" />
        <br />
        <br />
        <table>
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_titleE" runat="server" Text="Event Title:" AssociatedControlID="txt_titleE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("ev_id") %>' />
                    <asp:TextBox ID="txt_titleE" runat="server" Text='<%#Bind ("ev_title") %>' Columns="30" /> 
                    <asp:RequiredFieldValidator ID="rfv_titleE" runat="server" ControlToValidate="txt_titleE" ErrorMessage="Title is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_dateE" runat="server" Text="Event Date:" AssociatedControlID="txt_dateE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind ("ev_date") %>' />
                    <asp:RequiredFieldValidator ID="rfv_dateE" runat="server" ControlToValidate="txt_dateE" ErrorMessage="Date is required." Display="None" ValidationGroup="edit" />
                    <asp:CompareValidator ID="cmv_dateE" runat="server" ControlToValidate="txt_dateE" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please use valid date format: dd/mm/yyyy" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
                <td>
                    <asp:Label ID="lbl_descE" runat="server" Text="Description:" AssociatedControlID="txt_descE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_descE" runat="server" Text='<%#Bind ("ev_body") %>' TextMode="MultiLine" Columns="40" Rows="10" />
                    <asp:RequiredFieldValidator ID="rfv_descE" runat="server" ControlToValidate="txt_descE" ErrorMessage="Description is required." Display="None" ValidationGroup="edit" />
                </td>
            <tr>
                <td>
                    <asp:Label ID="lbl_imgE" runat="server" text="Image:" AssociatedControlID="txt_imgE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_imgE" runat="server" Text='<%#Bind ("ev_media") %>' />
                    <asp:Button ID="btn_uploadE" runat="server" Text="Upload" CausesValidation="false" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>    
                    <asp:Label ID="lbl_imgrulesE" runat="server" Text="(Max. upload: 500kb. Only .jpg, .png, .gif allowed.)" />
                    <%-- validation needed for img upload --%>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_update" runat="server" Text="Update Event" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Event" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                    <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
            <br />
            <br />
    </asp:Panel>
</asp:Content>

