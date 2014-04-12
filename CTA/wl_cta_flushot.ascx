<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_flushot.ascx.cs" Inherits="wl_cta_flushot" %>

<div id="aside2">
    <asp:Panel ID="pnl_flu" runat="server">
        <asp:Label ID="lbl_flu" Text="Flu Season Is Here!<br /><br />" runat="server" />
        <asp:Image ID="img_flu" runat="server" ImageUrl="~/Images/cta_flu.jpg" />
        <br />
        <asp:LinkButton ID="lkb_flu" runat="server" PostBackUrl="~/ps_appointment.aspx" Text="Get Your Flu Shot Today" />

    </asp:Panel>
</div>