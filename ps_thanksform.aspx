<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ps_thanksform.aspx.cs" Inherits="ps_thanksform" %>
<%-- Page by Puneet Saini --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
     <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/ps_thanksformADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

   <br /><br />
    <%-- page instructions --%>
    <asp:Label ID="lbl_heading" runat="server" Text="Do you have a special thank you, you would like to pass on to one of our departments, staff members, physician’s or volunteers or a success story that you would like to share with us." />
    <br />
    <br />
        
      <%-- initializing AJAX toolkit manager for calendar popout --%>         
    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <%--Form for sending thanks messages --%>
    <table  >
        <tr>
            <td><asp:Label ID="lbl_date" runat="server" Text="Date" /></td>
            <td><asp:TextBox ID="txt_date" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_date" runat="server" ValidationGroup="insert" Text="*Required" ControlToValidate="txt_date" /></td>
     <td><ajax:CalendarExtender ID="ce" runat="server"  TargetControlID="txt_date"  FirstDayOfWeek="Sunday" /></td>
        </tr>
        <tr>
            <td>  <asp:Label ID="lbl_name" runat="server" Text=" Your Name" /></td>
            <td><asp:TextBox ID="txt_name" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ValidationGroup="insert" ControlToValidate="txt_name" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_email" runat="server" Text=" Your Email" /></td>
            <td> <asp:TextBox ID="txt_email" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ValidationGroup="Insert" Text="*Required" ControlToValidate="txt_email" />
     <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="txt_email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address!" ValidationGroup="insert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_department" runat="server" Text="Department" /></td>
            <td><asp:DropDownList ID="ddl_department" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_department" ValidationGroup="insert" runat="server" Text="*Required" ControlToValidate="ddl_department" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_staff" runat="server" Text="Staff Member Name" /></td>
            <td> <asp:DropDownList ID="ddl_doc" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_staff" runat="server" Text="*Required" ValidationGroup="insert" ControlToValidate="ddl_doc" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_thanksmsg" runat="server" Text="Thankyou Message" /> </td>
            <td> <asp:TextBox ID="txt_thanksmsg" runat="server" TextMode="MultiLine" Columns="40" Rows="5" />
    <asp:RequiredFieldValidator ID="rfv_thanksmsg" runat="server" Text="*Required" ValidationGroup="insert" ControlToValidate="txt_thanksmsg" /></td>
        </tr>
        <tr>
            <td></td>
           <td><asp:Button ID="btn_insert" runat="server" CssClass="submitButton" Text="Send" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" /></td>
        </tr>
         <%-- validation summary for insert group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
    </table>
     <%-- message of success failure to commit to DB goes here --%>
    <asp:Label ID="lbl_msg" runat="server" />
    
    
</asp:Content>

