<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="rf_waittime.aspx.cs" Inherits="rf_waittime" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/rf_waittimeADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />
    <asp:Panel ID="pnl_new" runat="server">
        <asp:Label ID="lbl_new" runat="server" Text="Emergency Wait Time" Font-Underline="true" />
        <br />
        <br /> 
        <asp:Label ID="lbl_wtime" runat="server" Width="90%" />         
        <br />
        <br />
        <br />
        <asp:Label ID="lbl_disc" runat="server" Width="90%" />
        <br />
        <br />
        <br />
        <asp:Button ID="btn_cancel" runat="server" Text="Refresh" href='javascript:history.go(-1)' CssClass ="adminbuttons" />
    </asp:Panel>
    <br /><br />
    <asp:Label ID="msg" runat="server" />
    <br />
</asp:Content>