<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wl_cta_newsletter.ascx.cs" Inherits="wl_cta_newsletter" %>


<asp:Panel ID="pnl_new" runat="server" BorderColor="Black" BorderWidth="1px">

            <asp:Label ID="lbl_new" runat="server" Text="Newsletter Sign Up" />

            <asp:Label ID="lbl_fname" runat="server" Text="First Name:" AssociatedControlID="fNameTB" />

            <asp:TextBox ID="fNameTB" runat="server" />

            <asp:Label ID="lbl_lname" runat="server" Text="Last Name:" AssociatedControlID="lNameTB" />

            <asp:TextBox ID="lNameTB" runat="server" />

            <asp:Label ID="lbl_email" runat="server" Text="Email:" AssociatedControlID="emailTB" />

            <asp:TextBox ID="emailTB" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="emailTB" ErrorMessage="Email is required." Display="Dynamic" ValidationGroup="insert" />
            <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="emailTB" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address!" ValidationGroup="insert" />
    <label for="newsletter">Subscribe to our newsletter?</label>
<asp:CheckBox ID="subscribeChkBox" runat="server"/>
<br class="clear"/>
<br />
<asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" />
</asp:Panel>



