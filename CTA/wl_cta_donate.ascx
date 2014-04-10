<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_donate.ascx.cs" Inherits="wl_cta_donate" %>

<asp:Panel ID="pnl_main" runat="server" BorderColor="Black" BorderWidth="1px" >

    <asp:Label ID="lbl_donate" runat="server" Text="Donate to LACGH Today!<br />Make a Difference! " />
    <br />
    <asp:Image ID="img_donate" runat="server" ImageUrl="~/Images/cta_donate.jpg"  />
    <br />
    <asp:Label ID="lbl_amt" runat="server" Text="Amount $: " AssociatedControlID="txt_amt" />
    <br />
    <asp:TextBox ID="txt_amt" runat="server"  />
    <asp:RequiredFieldValidator ID="rfv_amt" runat="server" ControlToValidate="txt_amt" />
    <div class="centerthis">
<%--    <asp:RadioButtonList ID="rbl_freq" runat="server" >
        <asp:ListItem Text="One-Time Donation" Value="Single" />
        <asp:ListItem Text="Monthly Donation" Value="Monthly" />
    </asp:RadioButtonList>--%>
    </div>
    <asp:HyperLink runat="server" ID="hpl_donate" Text="Donate Now!" NavigateUrl="~/sm_finddoc.aspx"  />
</asp:Panel>


