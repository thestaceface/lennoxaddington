<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_eventsADMIN.aspx.cs" Inherits="sm_eventsADMIN" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Label ID="lbl_name" runat="server" Text="Edit Page: Events Calendar" CssClass="admintitle" />
    <%-- initializing AJAX toolkit manager for calendar popout --%>
    <ajax:ToolkitScriptManager ID="tsm_main" runat="server" />
    <br /><br />

    <%-- page instructions --%>
    <asp:Label ID="lbl_page" runat="server" Text="Choose an event from the menu on the right to update an existing record, or " />
    <asp:LinkButton ID="lnk_select" runat="server" Text="create a new event." OnClick="subCreate" />
    <br /><br /><hr /><br />

    <%-- message of success failure to commit to DB goes here --%>
    <asp:Label ID="msg" runat="server" />
    <br />

    <%-- panel contains form for new record --%>
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Add a New Event" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <table class="tables">
            <tr>
                <td>
                    <asp:label ID="lbl_title" runat="server" Text="Event Title:*" AssociatedControlID="txt_title" />
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" Columns="30" />
                    <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="txt_title" ErrorMessage="Title is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>   
            <tr>
                <td>
                     <asp:Label ID="lbl_date" runat="server" Text="Event Date:*" AssociatedControlID="txt_date" />
                </td>
                <td>
                    <asp:TextBox ID="txt_date" runat="server" ToolTip="Format: dd/mm/yyyy" />
                    <ajax:CalendarExtender ID="cal_new" runat="server" TargetControlID="txt_date" FirstDayOfWeek="Sunday" Format="dd/MM/yyyy" />
                    <asp:RequiredFieldValidator ID="rfv_date" runat="server" ControlToValidate="txt_date" ErrorMessage="Date is required." Display="None" ValidationGroup="insert" />
                    <asp:CompareValidator ID="cmv_date" runat="server" ControlToValidate="txt_date" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please use valid date format: dd/mm/yyyy" Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label id="lbl_desc" runat="server" Text="Description:*" AssociatedControlID="txt_desc" />
                </td>
                <td>
                    <asp:TextBox ID="txt_desc" runat="server" TextMode="MultiLine" Columns="40" Rows="10" />
                    <asp:RequiredFieldValidator ID="rfv_desc" runat="server" ControlToValidate="txt_desc" ErrorMessage="Description is required." Display="None" ValidationGroup="insert" />
                </td>
            </tr>
            <tr>
                <%-- file upload for image --%>
                <td>
                    <asp:Label ID="lbl_img" runat="server" text="Image:" />
                </td>
                <td>
                    <asp:FileUpload ID="flu_event" runat="server" />
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
        <asp:Button ID="btn_insert" runat="server" Text="Create" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" CssClass="adminbuttons" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CausesValidation="false" ValidationGroup="insert" CssClass="adminbuttons" />
        <%-- validation summary for insert group --%>
        <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="True" HeaderText="Please Note:" ValidationGroup="insert" />
    </asp:Panel>

    <%-- panel contains form for updating record --%>
    <asp:Panel ID="pnl_edit" runat="server">
        <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Event" Font-Underline="true" />
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
                    <asp:label ID="lbl_titleE" runat="server" Text="Event Title:*" AssociatedControlID="txt_titleE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("ev_id") %>' />
                    <asp:TextBox ID="txt_titleE" runat="server" Text='<%#Bind ("ev_title") %>' Columns="30" ToolTip="Format: dd/mm/yyyy" /> 
                    <asp:RequiredFieldValidator ID="rfv_titleE" runat="server" ControlToValidate="txt_titleE" ErrorMessage="Title is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>    
                 <td>
                     <asp:Label ID="lbl_dateE" runat="server" Text="Event Date:*" AssociatedControlID="txt_dateE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind ("ev_date") %>' />
                    <ajax:CalendarExtender ID="cal_edit" runat="server" TargetControlID="txt_dateE" FirstDayOfWeek="Sunday" Format="dd/MM/yyyy" />
                    <asp:RequiredFieldValidator ID="rfv_dateE" runat="server" ControlToValidate="txt_dateE" ErrorMessage="Date is required." Display="None" ValidationGroup="edit" />
                    <asp:CompareValidator ID="cmv_dateE" runat="server" ControlToValidate="txt_dateE" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please use valid date format: dd/mm/yyyy" Display="None" ValidationGroup="edit" />
                </td>
            </tr>
                <td>
                    <asp:Label ID="lbl_descE" runat="server" Text="Description:*" AssociatedControlID="txt_descE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_descE" runat="server" Text='<%#Bind ("ev_body") %>' TextMode="MultiLine" Columns="40" Rows="10" />
                    <asp:RequiredFieldValidator ID="rfv_descE" runat="server" ControlToValidate="txt_descE" ErrorMessage="Description is required." Display="None" ValidationGroup="edit" />
                </td>
            <tr>
                <%-- file upload for image --%>
                <td>
                    <asp:Label ID="lbl_imgE" runat="server" text="Image:" />
                </td>
                <td>
                    <asp:FileUpload ID="flu_eventE" runat="server" />
                    <asp:Button ID="btn_upload" runat="server" Text="Upload" OnClick="subUpload" />
                    <br />
                    <asp:Label ID="lbl_filename" runat="server" Text='<%#Bind ("ev_media") %>' />
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
                    <asp:Button ID="btn_update" runat="server" Text="Update Event" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Event" CommandName="Delete" ValidationGroup="edit" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                    <%-- validation summary for edit group --%>
                    <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
                </td>
            </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
            <br /><br />
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cph_aside">
    <%-- user makes selection from sidebar to edit record --%>
    <asp:Label ID="lbl_select" runat="server" Text="Events" CssClass="sidebarlbl" />
    <br />
    <br />
    <asp:Repeater ID="rpt_select" runat="server">
        <ItemTemplate>
            <%-- clicking record opens edit form in main content section populated with record's data --%>
            <asp:Label ID="lbl_date" runat="server" Text='<%#Eval ("ev_date", "{0:d}") %>' CssClass="sidebarlinks" /><br />
            <asp:LinkButton ID="lnk_select" runat="server" Text='<%#Eval ("ev_title") %>' CommandName="Update" CommandArgument='<%#Eval ("ev_id") %>' OnCommand="subAdmin" CssClass="sidebarlinks" />
            <br />
            <br />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

