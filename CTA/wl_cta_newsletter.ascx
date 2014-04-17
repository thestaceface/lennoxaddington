<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_newsletter.ascx.cs" Inherits="wl_cta_newsletter" %>

<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_new" runat="server">

                <asp:Label ID="lbl_newsletter" runat="server" Text="Newsletter Sign Up" />
                <br />
                <asp:Image ID="img_newsletter" runat="server" ImageUrl="~/Images/cta_newsletter.jpg" />
                <br />
                <asp:Label ID="lbl_blurb" runat="server" Text="Register for the Lennox Addington County General Hospital e-Newsletter to get the latest health information, news and events!" />
                
    <br /><br />
    <asp:hyperlink ID="hpl_subscribe" runat="server" Text="Subscribe Now" NavigateUrl="~/newsletter.aspx" />
    </asp:Panel>
</div>


