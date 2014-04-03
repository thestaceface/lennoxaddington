<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ps_appointment.aspx.cs" Debug="true" Inherits="ps_appointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <h1>Book an appointment with us!</h1><br /><br />
    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    
    <table>
        <tr>
            <td><asp:Label ID="lbl_name" runat="server" Text="Your Name:" /></td>
            <td><asp:TextBox ID="txt_name" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ControlToValidate="txt_name"  ValidationGroup="insert"/>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_cardno" runat="server" Text="Patient Id:" /></td>
            <td><asp:TextBox ID="txt_cardno" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_cardno" runat="server" Text="*Required" ControlToValidate="txt_cardno" ValidationGroup="insert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_dept" runat="server" Text="Department" /></td>
            <td><asp:DropDownList ID="ddl_dept" runat="server" /> 
                 <asp:RequiredFieldValidator ID="rfv_dept" ValidationGroup="insert" runat="server" Text="*Required" ControlToValidate="ddl_dept" />             
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_doctor" runat="server" Text="Doctor Name:" /></td>
            <td><asp:DropDownList ID="ddl_doc" runat="server" />
                 <asp:RequiredFieldValidator ID="rfv_doc" ValidationGroup="insert" runat="server" Text="*Required" ControlToValidate="ddl_doc" />       
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_date" runat="server" Text="Date:" /></td>
           <td> <asp:TextBox ID="txt_date" runat="server" />
               <asp:RequiredFieldValidator ID="rfv_date" runat="server" ControlToValidate="txt_date" Text="*Required" />
           </td>
            <td><ajax:CalendarExtender ID="ce" runat="server"  TargetControlID="txt_date"  FirstDayOfWeek="Sunday" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_time" runat="server" Text="Time Slot:" /></td>
            <td><asp:DropDownList ID="ddl_time" runat="server" >
                <asp:ListItem>Select your time</asp:ListItem>
                <asp:ListItem>10:00-11:00</asp:ListItem>
                <asp:ListItem>11:00-12:00</asp:ListItem>
                <asp:ListItem>12:00-1:00</asp:ListItem>
                <asp:ListItem>1:00-2:00</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_reason" runat="server" Text="Reason" /></td>
            <td><asp:TextBox ID="txt_reason" runat="server" TextMode="MultiLine" Columns="40" Rows="5" />
                <asp:RequiredFieldValidator ID="rfv_reason" runat="server" ControlToValidate="txt_reason" Text="*Required" ValidationGroup="insert" />
            </td>
        </tr>
       <tr>
           <td></td>
           <td><asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" OnCommand="subAdmin" OnClick="subSubmit" ValidationGroup="insert" /></td>
       </tr>
    </table>
     <asp:Label ID="lbl_msg" runat="server" />
     <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
</asp:Content>

