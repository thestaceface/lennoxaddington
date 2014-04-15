<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_donate.ascx.cs" Inherits="wl_cta_donate" EnableTheming="true"  %>
<div id="aside2"><%--no actual functionality.  just a conceptual placeholder to redirect to proper page--%>
    <asp:Panel ID="pnl_main" runat="server">

        <asp:Label ID="lbl_donate" runat="server" Text="Donate to LACGH Today!<br />Make a Difference! " />
        <br />
        <asp:Image ID="img_donate" runat="server" ImageUrl="~/Images/cta_donate.jpg"  />
        <br />
        <asp:Label ID="lbl_amt" runat="server" Text="Amount $: " AssociatedControlID="txt_amt" />
        <br />
        <asp:TextBox ID="txt_amt" runat="server"  />
        <asp:RequiredFieldValidator ID="rfv_amt" runat="server" ControlToValidate="txt_amt" />

        <asp:HyperLink runat="server" ID="hpl_donate" Text="Donate Now!" NavigateUrl="~/db_donation.aspx"  />
    </asp:Panel>
</div>

