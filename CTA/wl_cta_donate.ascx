<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_donate.ascx.cs" Inherits="wl_cta_donate" %>

<asp:Panel ID="pnl_main" runat="server" BorderColor="Black" BorderWidth="1px">
    <asp:Label ID="lbl_donate" runat="server" Text="Donate to LACGH" />
    <asp:Label ID="lbl_amt" runat="server" Text="Amount $: " AssociatedControlID="txt_amt" />
    <asp:TextBox ID="txt_amt" runat="server"  />
    <asp:RequiredFieldValidator ID="rfv_amt" runat="server" ControlToValidate="txt_amt" />
    <asp:RadioButtonList ID="rbl_freq" runat="server" >
        <asp:ListItem Text="One-Time Donation" Value="Single" />
        <asp:ListItem Text="Monthly Donation" Value="Monthly" />
    </asp:RadioButtonList>

    <asp:Button runat="server" ID="btn_donate" Text="Donate Now!" />
</asp:Panel>


