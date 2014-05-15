<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_donate.ascx.cs" Inherits="wl_cta_donate" EnableTheming="true"  %>

<div class="large-12 medium-6 columns">
<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_main" runat="server" CssClass="cta_style">

        <asp:Label ID="lbl_donate" runat="server" Text="Donate to LACGH Today!" Font-Size="Larger" />
        <br />
        <asp:Image ID="img_donate" runat="server" ImageUrl="~/Images/cta_donate.jpg" Width="90%" />
        <br />
        <asp:Label ID="lbl_amt" runat="server" Text="Cash Gifts go towards the purchase of equipment and improvements."  Width="90%" /><br />
        <asp:HyperLink runat="server" ID="hpl_donate" Text="Donate Now!" NavigateUrl="~/db_donation.aspx" CssClass="cta_link"  />
    </asp:Panel>
</div>
</div>