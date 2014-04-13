<%@ Page Language="C#"  MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="e_card.aspx.cs" Inherits="e_card" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">


<asp:PlaceHolder ID="formPH" runat="server" Visible="true">

<div>



<asp:Panel ID="pnl_new" runat="server" >
 
<table>
<tr>
    <td><asp:Label ID="lbl_new" runat="server" Text="Send an E-Card to a Patient" /></td>

</tr>
<tr>
<td>
<asp:Label ID="lbl_fname" runat="server" Text="First Name:" AssociatedControlID="fNameTB" />
</td>
<td>
<asp:TextBox ID="fNameTB" runat="server" />
</td>
</tr>

<tr>
<td>
<asp:Label ID="lbl_lname" runat="server" Text="Last Name:" AssociatedControlID="lNameTB" />
</td>
<td>
<asp:TextBox ID="lNameTB" runat="server" />
</td>
</tr>


<tr>
<td>
<asp:Label ID="lbl_email" runat="server" Text="Email:" AssociatedControlID="emailTB" />
</td>
<td>
<asp:TextBox ID="emailTB" runat="server" />
<asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="emailTB" ErrorMessage="Email is required." ValidationGroup="insert" />
<asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="emailTB" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address!" ValidationGroup="insert" />
</td>
</tr>

<tr>
<td>
<b>Subject:</b>
</td><td><asp:TextBox ID="txtSubject" runat="server" /></td></tr>
<tr><td>
<b>Message:</b>
</td><td> <asp:TextBox ID="txtMessage" Rows="5" Columns="40" TextMode="MultiLine" runat="server"/></td></tr>


</table>
</asp:Panel>
<asp:Button ID="btnSubscribe" runat="server" OnClick="send_Click" Text="Send E-Card" ValidationGroup="insert" />


</div>

     <asp:Label runat="server" ID="lbl_msg" /> 

</asp:PlaceHolder>


            <%--<asp:DropDownList ID="lstBackColor" runat="server" 
Width="194px" Height="22px" /><br />
            <br />
            Choose a font:<br />
            <asp:DropDownList ID="lstFontName" runat="server" 
Width="194px" Height="22px" /><br />
            <br />
            Specify a numeric font size:<br />
            <asp:TextBox ID="txtFontSize" runat="server" /><br />
            <br />
            Choose a border style:<br />
            <asp:RadioButtonList ID="lstBorder" runat="server" 
Width="177px" Height="59px" /><br />
           <br />
            <asp:CheckBox ID="chkPicture" runat="server" Text="Add the
 Default Picture"></asp:CheckBox><br />
            <br />
            Enter the greeting text below:<br />
            <asp:TextBox ID="txtGreeting" runat="server" Width="240px" 
Height="85px" TextMode="MultiLine" /><br />
            <br />
            <asp:Button ID="cmdUpdate" OnClick="cmdUpdate_Click"
runat="server" Width="71px"
                Height="24px" Text="Send" />
        
        <!-- Here is the card: -->
        <asp:Panel ID="pnlCard" runat="server" Width="339px" 
Height="481px" HorizontalAlign="Center">
            <br />
            &nbsp;
            <asp:Label ID="lblGreeting" runat="server" Width="256px" 
Height="150px" /><br />
            <asp:Image ID="imgDefault" runat="server" Width="212px" 
Height="160px" />
        </asp:Panel>--%>
    
<%--<asp:PlaceHolder ID="successPH" runat="server" Visible="false">
<h2>You have successfully send an E-card to a Patient!</h2>
</asp:PlaceHolder>--%>
    
</asp:Content>
