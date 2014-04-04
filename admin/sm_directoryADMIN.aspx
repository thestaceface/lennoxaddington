<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_directoryADMIN.aspx.cs" Inherits="sm_directoryADMIN" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Label ID="lbl_head" runat="server" Text="Edit Page: Directory" CssClass="admintitle" />
    <br /><br />
    
    <%-- page instructions --%>
    <asp:Label ID="lbl_page" runat="server" Text="Select a contact record from the menu on the right to edit an existing record, or " />    
    <asp:LinkButton ID="lnk_select" runat="server" Text="create a new record." OnClick="subCreate" />
    <br /><br /><hr /><br />

    <%-- success/failure message goes here --%>
    <asp:Label ID="msg" runat="server" />
    <br />

    <%-- panel contains create new record form --%>
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Record" Font-Underline="true" />
        <br /><br />

        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br /><br />

        <%-- type, name, and fax are optional fields. everything else has required field validators, and any other necessary validation --%>
        <table class="tables">
            <tr>
                <td>
                    <asp:label ID="lbl_title" runat="server" Text="Contact Title:*" AssociatedControlID="txt_title" />
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
                     <asp:Label ID="lbl_tel" runat="server" Text="Telephone:*" AssociatedControlID="txt_tel" />
                </td>
                <td>
                    <asp:TextBox ID="txt_tel" runat="server" ToolTip="Format: (555) 555-5555" />
                    <asp:RequiredFieldValidator ID="rfv_tel" runat="server" ControlToValidate="txt_tel" ErrorMessage="Telephone is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_tel" runat="server" ControlToValidate="txt_tel" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_fax" runat="server" Text="Fax:" AssociatedControlID="txt_fax" />
                </td>
                <td>
                    <asp:TextBox ID="txt_fax" runat="server" ToolTip="Format: (555) 555-5555" />
                    <asp:RegularExpressionValidator ID="reg_fax" runat="server" ControlToValidate="txt_fax" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" ToolTip="Format: email@email.com" />
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Email is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_loc" runat="server" text="Location:*" AssociatedControlID="txt_loc" />
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
        <%-- validation summary for insert group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>

    <%-- panel contains update form --%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" Font-Underline="true" />
        <br /><br />

        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br /><br />

        <%-- as above, type, name, and fax are optional --%>
        <table class="tables">
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_titleE" runat="server" Text="Contact Title:*" AssociatedControlID="txt_titleE" />
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
                     <asp:Label ID="lbl_telE" runat="server" Text="Telephone:*" AssociatedControlID="txt_telE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_telE" runat="server" Text='<%#Bind ("of_tel") %>' ToolTip="Format: (555) 555-5555" />
                    <asp:RequiredFieldValidator ID="rfv_telE" runat="server" ControlToValidate="txt_telE" ErrorMessage="Telephone is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_telE" runat="server" ControlToValidate="txt_telE" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_faxE" runat="server" Text="Fax:" AssociatedControlID="txt_faxE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_faxE" runat="server" Text='<%#Bind ("of_fax") %>' ToolTip="Format: (555) 555-5555" />
                    <asp:RegularExpressionValidator ID="reg_faxE" runat="server" ControlToValidate="txt_faxE" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_emailE" runat="server" Text="Email:*" AssociatedControlID="txt_emailE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("of_email") %>' ToolTip="Format: email@email.com" />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_locE" runat="server" text="Location:*" AssociatedControlID="txt_locE" />
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
            <%-- validation summary for edit group --%>
            <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
        </table>
            <br /><br />
    </asp:Panel>
</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="cph_aside">
    
    <%-- sidebar contains record titles to select for editing --%>
    <asp:Label ID="lbl_select" runat="server" Text="Offices" CssClass="sidebarlbl" />
    <br /><br />

    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <%-- clicking a record opens form in main content populated with record's data --%>
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("of_title") %>' CommandName="Update" CommandArgument='<%#Eval ("of_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br /><br />
        </ItemTemplate>
    </asp:Repeater>  
</asp:Content>
