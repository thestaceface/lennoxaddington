<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_faq.ascx.cs" Inherits="CTA_wl_cta_faq" %>

<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_faq" runat="server">
        <asp:Label runat="server" ID="lbl_faq" Text="   Frequently Asked Questions" />
        <br />
        <asp:Image ID="img_faq" runat="server" ImageUrl="~/Images/cta_question.jpg"  ImageAlign="Middle"  /> <br />
    
        <br />
        <asp:hyperlink runat="server" ID="lkb_faq" Text="View all our FAQs" NavigateUrl="~/faq.aspx" />

    </asp:Panel>
</div>