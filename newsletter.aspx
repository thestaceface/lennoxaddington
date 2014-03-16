<%@ Page Language="C#"  MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">


<asp:PlaceHolder ID="formPH" runat="server" Visible="true">
<div id="formLayout">
<fieldset>
<legend>Newsletter Sign Up</legend>
<label for="fName">First name:</label>
<asp:TextBox ID="fNameTB" runat="server" />
<asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="fNameTB" ErrorMessage="You must enter a first name!" />
<br class="clear" />
<br />
<label for="lName">Last name:</label>
<asp:TextBox ID="lNameTB" runat="server" />
<asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="lNameTB" ErrorMessage="You must enter a last name!" />
<br class="clear" />
<br />
<label for="email">Email Address:</label>
<asp:TextBox ID="emailTB" runat="server" />
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailTB" ErrorMessage="You must enter an email address!"/>
<br class="clear" />
<br />
<label for="newsletter">Subscribe to our newsletter?</label>
<asp:CheckBox ID="subscribeChkBox" runat="server"/>
<br class="clear"/>
<br />
<asp:Button ID="btnSubscribe" runat="server" OnClick="subscribe_Click" Text="Subscribe" />
</fieldset>
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="successPH" runat="server" Visible="false">
<h2>You have successfully signed up for our newsletter!</h2>
</asp:PlaceHolder>



</asp:Content>
