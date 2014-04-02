<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_faq.ascx.cs" Inherits="CTA_wl_cta_faq" %>
<asp:Panel ID="pnl_faq" runat="server" BorderColor="Black" BorderWidth="1px" >
    <asp:Label runat="server" ID="lbl_faq" Text="FAQ CTA" />
    <asp:Label runat="server" ID="lbl_faqdesc" Text="click the link to see all our most recent faqs" />
    <asp:LinkButton runat="server" ID="lkb_faq" Text="go to the faq page" PostBackUrl="~/faq.aspx" />


</asp:Panel>