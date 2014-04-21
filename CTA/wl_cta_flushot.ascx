<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_flushot.ascx.cs" Inherits="wl_cta_flushot" %>

<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_flu" runat="server" CssClass="cta_style">
        <asp:Label ID="lbl_flu" Text="Flu Season Is Here!<br />" runat="server" Font-Size="Larger" />
        <asp:Image ID="img_flu" runat="server" ImageUrl="~/Images/cta_flu.jpg"  />
        <br />
        <asp:LinkButton ID="lkb_flu" runat="server" PostBackUrl="~/ps_appointment.aspx" Text="Book Your Flu Shot!" CssClass="cta_link" />

    </asp:Panel>
</div>