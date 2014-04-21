<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_newsletter.ascx.cs" Inherits="wl_cta_newsletter" %>

<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_new" runat="server" CssClass="cta_style">

                <asp:Label ID="lbl_newsletter" runat="server" Text="Newsletter Sign-Up" Font-Size="Larger" />
                <br />
                <asp:Image ID="img_newsletter" runat="server" ImageUrl="~/Images/newsletter.png" Width="90%" Height="150" />
                <br />
                <asp:Label ID="lbl_blurb" runat="server" Text="Register for the LACGH e-Newsletter to keep up to date!" Width="90%" />
                
    
    <asp:hyperlink ID="hpl_subscribe" runat="server" Text="Subscribe Now" NavigateUrl="~/newsletter.aspx" CssClass="cta_link" />
    </asp:Panel>
</div>


