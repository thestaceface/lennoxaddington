<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="rf_feedbackADMIN.aspx.cs" Inherits="Default2" %>
<%-- Rezwanul Ferdous 824-259-246 --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
    <br />
    <asp:Label ID="lbl_page" runat="server" Text="Select a Feedback record from the menu on the right to edit an existing record. " />
    <%-- Create new record intentionally disabled for the admin as it will be done by the public page --%>
    <%-- <asp:LinkButton ID="lnk_select" runat="server" Text="or, create a new record." OnClick="subCreate" /> --%>
    <br />
    <br />
    <hr />
    <br />
    <%-- success/failure message goes here --%>
    <asp:Label ID="msg" runat="server" />
    <br />
    <%-- new panel contains create new record form --%>
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <%-- Record columns with required field validators, and any other necessary validation --%>
        <table class="tables"> 
            <tr>
                <td>
                    <asp:label ID="lbl_category" runat="server" Text="Category:" AssociatedControlID="ddl_category" />
                </td>
                <td>
                    <asp:DropDownList ID="ddl_category" runat="server" /> 
                </td>
            </tr>
            <tr>
                <td>
                    <asp:label ID="lbl_subject" runat="server" Text="Subject:*" AssociatedControlID="txt_subject" />
                </td>
                <td>
                    <asp:TextBox ID="txt_subject" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_subject" runat="server" ControlToValidate="txt_subject" ErrorMessage="Subject is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_last" runat="server" Text="Last Name:*" AssociatedControlID="txt_last" />                            
                </td>
                <td>
                    <asp:TextBox ID="txt_last" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_last" runat="server" ControlToValidate="txt_last" ErrorMessage="Last Name is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_first" runat="server" Text="First Name:*" AssociatedControlID="txt_first" />
                </td>
                <td>
                    <asp:TextBox ID="txt_first" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_first" runat="server" ControlToValidate="txt_first" ErrorMessage="First Name is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_tel" runat="server" Text="Telephone:*" AssociatedControlID="txt_tel" />
                </td>
                <td>
                    <asp:TextBox ID="txt_tel" runat="server" ToolTip="Format: (555) 555-5555" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_tel" runat="server" ControlToValidate="txt_tel" ErrorMessage="Telephone is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_tel" runat="server" ControlToValidate="txt_tel" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_email" runat="server" Text="Email:*" AssociatedControlID="txt_email" />
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" ToolTip="Format: email@email.com" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Email is required." Display="None" ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_street" runat="server" text="Street:*" AssociatedControlID="txt_street" />
                </td>
                <td>
                    <asp:TextBox ID="txt_street" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_street" runat="server" ControlToValidate="txt_street" ErrorMessage="Street is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_appt" runat="server" text="Appartment:*" AssociatedControlID="txt_appt" />
                </td>
                <td>
                    <asp:TextBox ID="txt_appt" runat="server" Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_city" runat="server" text="City:*" AssociatedControlID="txt_city" />
                </td>
                <td>
                    <asp:TextBox ID="txt_city" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" ErrorMessage="City is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_province" runat="server" text="Province:*" AssociatedControlID="txt_province" />
                </td>
                <td>
                    <asp:TextBox ID="txt_province" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_province" runat="server" ControlToValidate="txt_province" ErrorMessage="Province is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_country" runat="server" text="Country:*" AssociatedControlID="txt_country" />
                </td>
                <td>
                    <asp:TextBox ID="txt_country" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_country" runat="server" ControlToValidate="txt_country" ErrorMessage="Country is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_message" runat="server" text="Message:*" AssociatedControlID="txt_message" />
                </td>
                <td>
                    <asp:TextBox ID="txt_message" runat="server"  TextMode="multiline" Columns="40" Rows="20" />
                    <asp:RequiredFieldValidator ID="rfv_message" runat="server" ControlToValidate="txt_message" ErrorMessage="Message is required." Display="None" ValidationGroup="insert" />
                </td> 
            </tr>
        </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert Record" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="edit" CssClass="adminbuttons" />
        <%-- validation summary messages for insert validation group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>

    <%-- edit panel contains update form --%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <%-- Record loaded to form for update with required field validators, and any other necessary validation --%>
        <table class="tables">
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_categoryE" runat="server" Text="Category:*" AssociatedControlID="txt_categoryE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("fd_id") %>' />
                    <asp:Textbox ID="txt_categoryE" runat="server" Text='<%#Bind ("fd_category") %>' /> 
                    <asp:RequiredFieldValidator ID="rfv_categoryE" runat="server" ControlToValidate="txt_categoryE" ErrorMessage="Feedback Category is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_subjectE" runat="server" Text="Subject:*" AssociatedControlID="txt_subjectE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_subjectE" runat="server" Text='<%#Bind ("fd_subject") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_subjectE" runat="server" ControlToValidate="txt_subjectE" ErrorMessage="Subject is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_lastE" runat="server" Text="Last Name:*" AssociatedControlID="txt_lastE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lastE" runat="server" Text='<%#Bind ("fd_last") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_nameE" runat="server" Text="First Name:*" AssociatedControlID="txt_firstE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_firstE" runat="server" Text='<%#Bind ("fd_first") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_firstE" runat="server" ControlToValidate="txt_firstE" ErrorMessage="First name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_telE" runat="server" Text="Telephone:*" AssociatedControlID="txt_telE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_telE" runat="server" Text='<%#Bind ("fd_tel") %>' ToolTip="Format: (555) 555-5555" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_telE" runat="server" ControlToValidate="txt_telE" ErrorMessage="Telephone is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_telE" runat="server" ControlToValidate="txt_telE" ValidationExpression="((\(\d{3}\) ?)|(\d{3}[- \.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$" ErrorMessage="Please enter valid telephone number: (555) 555-5555 Optional extension: (555) 555-5555 x555" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_emailE" runat="server" Text="Email:*" AssociatedControlID="txt_emailE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("fd_email") %>' ToolTip="Format: email@email.com" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_streetE" runat="server" text="Street:*" AssociatedControlID="txt_streetE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_streetE" runat="server" Text='<%#Bind ("fd_street") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_streetE" runat="server" ControlToValidate="txt_streetE" ErrorMessage="Street is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_apptE" runat="server" text="Appartment:" AssociatedControlID="txt_apptE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_apptE" runat="server" Text='<%#Bind ("fd_appt") %>' Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_cityE" runat="server" text="City:*" AssociatedControlID="txt_cityE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_cityE" runat="server" Text='<%#Bind ("fd_city") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_cityE" runat="server" ControlToValidate="txt_cityE" ErrorMessage="City is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_provinceE" runat="server" text="Province:*" AssociatedControlID="txt_provinceE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_provinceE" runat="server" Text='<%#Bind ("fd_province") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_provinceE" runat="server" ControlToValidate="txt_provinceE" ErrorMessage="Province is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr
            <tr>
                <td>
                    <asp:Label ID="lbl_countryE" runat="server" text="Country:*" AssociatedControlID="txt_countryE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_countryE" runat="server" Text='<%#Bind ("fd_country") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_countryE" runat="server" ControlToValidate="txt_countryE" ErrorMessage="Country is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
                <td>
                    <asp:Label ID="lbl_messageE" runat="server" text="Message:*" AssociatedControlID="txt_messageE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_messageE" runat="server" Text='<%#Bind ("fd_message") %>' TextMode="multiline" Columns="40" Rows="20" />
                    <asp:RequiredFieldValidator ID="rfv_messageE" runat="server" ControlToValidate="txt_messageE" ErrorMessage="Message is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <%-- Update feedback record also disabled intentionally - Admin only review and delete the record, if required --%>
                    <%-- <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" /> --%>
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
                </ItemTemplate>
            </asp:Repeater>
            <%-- validation summary messages for edit validation group --%>
            <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
        </table>
            <br />
            <br />
    </asp:Panel>
</asp:Content>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="cph_aside">
    <asp:Label ID="lbl_select" runat="server" Text="Feedback" CssClass="sidebarlbl" />
    <br />
    <br />
    <%-- sidebar contains record titles to select for editing --%>
    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <%-- clicking a record opens form in main content populated with record's data for delete --%>
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("fd_selector") %>' CommandName="Update" CommandArgument='<%#Eval ("fd_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>  
</asp:Content>


