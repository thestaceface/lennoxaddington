<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="rf_waittime.aspx.cs" Inherits="rf_waittime" %>
<%-- Rezwanul Ferdous 824-259-246 --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/rf_waittimeADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />
    <%-- initializing AJAX Toolkit to use calendar control --%>
    <AJAX:ToolkitScriptManager ID="tsm_main" runat="server" />
    <asp:Panel ID="pnl_new" runat="server">
        <br />
        <%-- Page info --%>
        <asp:Label ID="lbl_new" runat="server" Text="Current waiting time at Hospital Emergency" Font-Underline="true" />
        <br />
        <br /> 
        <%-- Two labes to display calculated wait time for emergency department with different CSS class to control display color
            either green or red. Message will be display green, if wait time is upto 3 hours. Red message will be displayed for the
            wait time more than three hours. System message will be displayed in red color, if information not available --%>
        <asp:Label CssClass="wt1" ID="lbl_wtime1" runat="server" Width="90%" />
        <asp:Label CssClass="wt2" ID="lbl_wtime2" runat="server" Width="90%" />
        <%-- Timer to refresh the wait time after re-calculation automatically after 30 seconds (29 Seconds) --%>
        <asp:Timer ID="tmr_main" runat="server" Interval="29000" OnTick="subTick" />  
        <br />
        <br />
        <%-- Label to display disclaimer public notice --%>
        <asp:Label ID="lbl_disc" runat="server" Width="90%" />
        <br />
        <br />
        <br />
        <asp:Button ID="btn_refresh" runat="server" Text="Refresh" href='javascript:history.go(-1)' CssClass ="adminbuttons" />
    </asp:Panel>
    <br />
</asp:Content>