<%@ Page Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="unsubscribe.aspx.cs" Inherits="unsubscribe" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

<asp:PlaceHolder ID="formPH" runat="server" Visible="true">
<div id="unsubscribeLayout">

<asp:Label ID="lbl_new" runat="server" Text="Unsubscribe" />
    <br />
<label for="email">Email Address:</label>
<asp:TextBox ID="emailTB" runat="server" />
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailTB" ErrorMessage="We need an email address!" />
    <br />
<asp:Button ID="btnUnSubscribe" runat="server" OnClick="unsubscribe_Click" Text="Unsubscribe" />

</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="successPH" runat="server" Visible="false">
<h2>We have successfully unsubscribed you from future emails.</h2>
</asp:PlaceHolder>

</asp:Content>
