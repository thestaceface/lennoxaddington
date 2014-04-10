<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_faq.ascx.cs" Inherits="CTA_wl_cta_faq" %>
<asp:Panel ID="pnl_faq" runat="server" BorderColor="Black" BorderWidth="1px" >
    <asp:Label runat="server" ID="lbl_faq" Text="   Frequently Asked Questions" />
    <br />
    <asp:Image ID="img_faq" runat="server" ImageUrl="~/Images/cta_question.jpg"  ImageAlign="Middle"  /> <br />
    <%--<asp:Label runat="server" ID="lbl_faqdesc" Text="Did you know that LACGH accepts PayPal donations?" />--%>
    <br />
    <asp:hyperlink runat="server" ID="lkb_faq" Text="View all our FAQs" NavigateUrl="~/faq.aspx" />


</asp:Panel>