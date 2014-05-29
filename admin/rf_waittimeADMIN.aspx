<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="rf_waittimeADMIN.aspx.cs" Inherits="Default2" Debug="true" %>
<%-- Rezwanul Ferdous 824-259-246 --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <br />
    <br />
    <%-- page instructions --%>
    <asp:Label ID="lbl_page" runat="server" Text="Select a existing record from the menu on the right to edit " />
    <%-- There is only one record in System Information table - which only need to update frequently - Insert new record is disabled intentionally --%>
    <%-- Functionality for adding new record is here for future use, if any other clinic or department needs to process wait time too --%>
    <%-- <asp:LinkButton ID="lnk_select" runat="server" Text=", or create a new record." OnClick="subCreate" /> --%>
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
        <table class="tables">
            <tr>
                <td>
                    <asp:label ID="lbl_id" runat="server" Text="Info ID:*" AssociatedControlID="txt_id" />
                </td>
                <td>
                    <asp:TextBox ID="txt_id" runat="server" Columns="40" /> 
                    <asp:RequiredFieldValidator ID="rfv_id" runat="server" ControlToValidate="txt_id" ErrorMessage="Id is required." Display="None" ValidationGroup="insert" />

                </td>
            </tr>
            <tr>
                <td>
                    <asp:label ID="lbl_desc" runat="server" Text="Description:*" AssociatedControlID="txt_desc" />
                </td>
                <td>
                    <asp:TextBox ID="txt_desc" runat="server" Columns="40" /> 
                    <asp:RequiredFieldValidator ID="rfv_desc" runat="server" ControlToValidate="txt_desc" ErrorMessage="Description is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:label ID="lbl_numdoctor" runat="server" Text="#Doctors:*" AssociatedControlID="txt_numdoctor" />
                    <asp:RequiredFieldValidator ID="rfv_numdoctor" runat="server" ControlToValidate="txt_numdoctor" ErrorMessage="Number of doctors on duty is required." Display="None" ValidationGroup="insert" />
                </td>
                <td>
                    <asp:TextBox ID="txt_numdoctor" runat="server" Columns="40" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:label ID="lbl_avgtime" runat="server" Text="Average Time:*" AssociatedControlID="txt_avgtime" />
                    <asp:RequiredFieldValidator ID="rfv_avgtime" runat="server" ControlToValidate="txt_avgtime" ErrorMessage="Average time is required." Display="None" ValidationGroup="insert" />
                </td>
                <td>
                    <asp:TextBox ID="txt_avgtime" runat="server" Columns="40" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_patients" runat="server" Text="#Registered:" AssociatedControlID="txt_patients" />                            
                </td>
                <td>
                    <asp:TextBox ID="txt_patients" runat="server" Columns="40" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_attended" runat="server" Text="#Attended:" AssociatedControlID="txt_attended" />
                </td>
                <td>
                    <asp:TextBox ID="txt_attended" runat="server" Columns="40" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_today" runat="server" Text="Date:" AssociatedControlID="txt_date" />
                </td>
                <td>
                    <asp:TextBox ID="txt_date" runat="server" Columns="40" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lbl_waittime" runat="server" text="Wait Time:" AssociatedControlID="txt_waittime" />
                </td>
                <td>
                    <asp:TextBox ID="txt_waittime" runat="server" Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_waiting" runat="server" text="#Wating:" AssociatedControlID="txt_waiting" />
                </td>
                <td>
                    <asp:TextBox ID="txt_waiting" runat="server" Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_dept" runat="server" text="Department:" AssociatedControlID="txt_dept" />
                </td>
                <td>
                    <asp:TextBox ID="txt_dept" runat="server" Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_lupdate" runat="server" text="Last Update:" AssociatedControlID="txt_lupdate" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lupdate" runat="server" Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_message" runat="server" text="Message:" AssociatedControlID="txt_message" />
                </td>
                <td>
                    <asp:TextBox ID="txt_message" runat="server"  TextMode="multiline" Columns="40" Rows="5" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_updateby" runat="server" Text="Updated by:" AssociatedControlID="txt_updateby" />                            
                </td>
                <td>
                    <asp:TextBox ID="txt_updateby" runat="server" Columns="40" />
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
        <asp:Label ID="lbl_edit" runat="server" Text="Update Information to display wait time" Font-Underline="true" />
        <br />
        <asp:Label ID="lbl_instuction" runat="server" />
        <br />
        <br />
        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <%-- Record description,number of doctors on duty and average has required field validators, and range validation --%>
        <%-- Other fields are optional thus validation is not required --%>
        <table class="tables">
            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
            <tr>
                <td>
                    <asp:label ID="lbl_descE" runat="server" Text="Description:*" AssociatedControlID="txt_descE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("si_id") %>' />
                    <asp:Textbox ID="txt_descE" runat="server" Text='<%#Bind ("si_desc") %>' Columns="40" /> 
                    <asp:RequiredFieldValidator ID="rfv_descE" runat="server" ControlToValidate="txt_descE" ErrorMessage="Description is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_numdoctorE" runat="server" Text="#Doctor:*" AssociatedControlID="txt_numdoctorE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_numdoctorE" runat="server" Text='<%#Bind ("si_numdoctor") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_numdoctorE" runat="server" ControlToValidate="txt_numdoctorE" ErrorMessage="Number of doctors on duty is required." Display="None" ValidationGroup="edit" />
                    <asp:RangeValidator ID="rnv_numdoctorE" runat="server" ControlToValidate="txt_numdoctorE" MaximumValue="99" MinimumValue="1" ErrorMessage="Doctors on duty must be greater than 0." Display="None" ValidationGroup="edit" /> 
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_avgtimeE" runat="server" Text="Average Time:" AssociatedControlID="txt_avgtimeE" />
                    <asp:RequiredFieldValidator ID="rfv_avgtimeE" runat="server" ControlToValidate="txt_avgtimeE" ErrorMessage="Average time is required." Display="None" ValidationGroup="edit" />
                </td>
                <td>
                    <asp:TextBox ID="txt_avgtimeE" runat="server" Text='<%#Bind ("si_avgtime") %>' Columns="40" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_patientE" runat="server" Text="#Registered:" AssociatedControlID="txt_patientE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_patientE" runat="server" Text='<%#Bind ("si_numregistered") %>' Columns="40" />
                    <asp:RangeValidator ID="rnv_patientE" runat="server" ControlToValidate="txt_patientE" MaximumValue="9999" MinimumValue="0" ErrorMessage="Patient register must be between 0-9999." Display="None" ValidationGroup="edit" /> 
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_attendedE" runat="server" Text="#Attended:" AssociatedControlID="txt_attendedE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_attendedE" runat="server" Text='<%#Bind ("si_numattended") %>' Columns="40" />
                    <asp:RangeValidator ID="rnv_attendedE" runat="server" ControlToValidate="txt_attendedE" MaximumValue="9999" MinimumValue="0" ErrorMessage="Patient attended must be between 0-9999." Display="None" ValidationGroup="edit" /> 
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_dateE" runat="server" Text="Todays Date:*" AssociatedControlID="txt_dateE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind ("si_today", "{0:d}") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_dateE" runat="server" ControlToValidate="txt_dateE" ErrorMessage="Valid date MM/DD/YYYY is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_waittimeE" runat="server" text="Wait Time:" AssociatedControlID="txt_waittimeE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_waittimeE" runat="server" Text='<%#Bind ("si_waittime") %>' Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_waitingE" runat="server" text="#Wating:" AssociatedControlID="txt_waitingE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_waitingE" runat="server" Text='<%#Bind ("si_numwaiting") %>' Columns="40" />
                    <asp:RangeValidator ID="rnv_waitingE" runat="server" ControlToValidate="txt_waitingE" MaximumValue="9999" MinimumValue="0" ErrorMessage="Patient waiting must be between 0-9999." Display="None" ValidationGroup="edit" /> 
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_deptE" runat="server" text="Department ID:*" AssociatedControlID="txt_deptE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_deptE" runat="server" Text='<%#Bind ("si_d_id") %>' Columns="40" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_lupdateE" runat="server" text="Last Update:*" AssociatedControlID="txt_lupdateE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lupdateE" runat="server" Text='<%#Bind ("si_lupdate", "{0:d}") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_lupdateE" runat="server" ControlToValidate="txt_lupdateE" ErrorMessage="Valid update date MM/DD/YYYY is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            </tr>
                <td>
                    <asp:Label ID="lbl_messageE" runat="server" text="Message:*" AssociatedControlID="txt_messageE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_messageE" runat="server" Text='<%#Bind ("si_message") %>' TextMode="multiline" Columns="40" Rows="5" />
                    <asp:RequiredFieldValidator ID="rfv_messageE" runat="server" ControlToValidate="txt_messageE" ErrorMessage="Message is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_updatebyE" runat="server" text="Update By:" AssociatedControlID="txt_updatebyE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_updatebyE" runat="server" Text='<%#Bind ("si_updateby") %>' Columns="40" />
                </td>
            </tr>     
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <%-- There is only one record in System Information table - which only need to update frequently - Delte record is disabled intentionally --%>
                    <%--  <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" /> --%>
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
    <asp:Label ID="lbl_select" runat="server" Text="Emergency Wait Time" CssClass="sidebarlbl" />
    <br />
    <br />
    <%-- sidebar contains record titles to select for editing --%>
    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <%-- clicking a record opens form in main content populated with record's data for update --%>
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("si_desc") %>' CommandName="Update" CommandArgument='<%#Eval ("si_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>  
</asp:Content>


