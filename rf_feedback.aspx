<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="rf_feedback.aspx.cs" Inherits="rf_feedback" %>
<%-- Rezwanul Ferdous 824-259-246 --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/rf_feedbackADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />
    <asp:Panel ID="pnl_new" runat="server">
      <%-- users instructions to complete feedback form and submit--%>
        <asp:Label ID="lbl_new" runat="server" Text="Complete Feedback Form and submit" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br />
        <br />

     <%-- Dislaying the form in a table to capture users feedback--%>
     <%-- Some columns values are optional and several columns are with required and pattern validation check --%>
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
                    <asp:label ID="lbl_subject" runat="server" Text="Feedback Subject:*" AssociatedControlID="txt_subject" />
                </td>
                <td>
                    <asp:TextBox ID="txt_subject" runat="server" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_subject" runat="server" ControlToValidate="txt_subject" ErrorMessage="Feedback subject is required." Display="None" ValidationGroup="insert" />
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
                    <asp:Label ID="lbl_appt" runat="server" text="Appartment:" AssociatedControlID="txt_appt" />
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
        <asp:Button ID="btn_insert" runat="server" Text="Send your feedback" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Reset the form" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="edit" CssClass="adminbuttons" />
        <%-- validation summary for the insert group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />

    </asp:Panel>
    <br /><br />
    <%-- message of success failure to commit to DB goes here --%>
    <asp:Label ID="msg" runat="server" />
    <br />
</asp:Content>