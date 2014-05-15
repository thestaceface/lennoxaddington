<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_faq.ascx.cs" Inherits="CTA_wl_cta_faq" %>

<div class="medium-6 columns">
<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_faq" runat="server" CssClass="cta_style">
        <asp:Label runat="server" ID="lbl_faq" Text="   Frequently Asked Questions" Font-Size="Larger" />
        <br />
        <asp:Image ID="img_faq" runat="server" ImageUrl="~/Images/cta_question.jpg"  ImageAlign="Middle" width="50%"  /> <br />
    
        <br />
        <asp:hyperlink runat="server" ID="lkb_faq" Text="View all our FAQs" NavigateUrl="~/faq.aspx" CssClass="cta_link" />

    </asp:Panel>
</div>
    </div>