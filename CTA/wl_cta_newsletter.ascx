<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_newsletter.ascx.cs" Inherits="wl_cta_newsletter" %>

<div id="aside2">
<asp:Panel ID="pnl_new" runat="server">

            <asp:Label ID="lbl_newsletter" runat="server" Text="Newsletter Sign Up" />
            <br />
            <asp:Image ID="img_newsletter" runat="server" ImageUrl="~/Images/cta_newsletter.jpg" />
            <br />
            <asp:Label ID="lbl_name" runat="server" Text="Name:" />
            <asp:TextBox ID="txt_name" runat="server" />
            <br />

            <asp:Label ID="lbl_email" runat="server" Text="Email:" />
            <asp:TextBox ID="txt_email" runat="server" />
            <br />
            
            <asp:Label ID="lbl_subs" runat="server" for="newsletter">Subscribe to our newsletter?</asp:Label>
<asp:CheckBox ID="subscribeChkBox" runat="server"/>
<br />
<br />
<asp:hyperlink ID="hpl_subscribe" runat="server" Text="Subscribe" NavigateUrl="~/newsletter.aspx" />
</asp:Panel>
</div>


