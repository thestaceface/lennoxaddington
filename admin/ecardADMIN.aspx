<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ecardADMIN.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

     <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br />
        <br />
        <table class="tables">
            <asp:label runat="server" ID="lbl_msg"/> 

            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
          
            <tr>    
                 <td>
                     <asp:Label ID="lbl_subjectE" runat="server" Text="Subject:*" AssociatedControlID="txt_subjectE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("Id") %>' />
                    <asp:TextBox ID="txt_subjectE" runat="server" Text='<%#Bind ("subject") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_subjectE" runat="server" ControlToValidate="txt_subjectE" ErrorMessage="Subject is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_lastE" runat="server" Text="Last Name:*" AssociatedControlID="txt_lastE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lastE" runat="server" Text='<%#Bind ("lname") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_nameE" runat="server" Text="First Name:*" AssociatedControlID="txt_firstE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_firstE" runat="server" Text='<%#Bind ("fname") %>' Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_firstE" runat="server" ControlToValidate="txt_firstE" ErrorMessage="First name is required." Display="None" ValidationGroup="edit" />
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_emailE" runat="server" Text="Email:*" AssociatedControlID="txt_emailE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("email") %>' ToolTip="Format: email@email.com" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />
                </td>
            </tr>

           <tr>
                <td>
                    <asp:Label ID="lbl_messageE" runat="server" text="Message:*" AssociatedControlID="txt_messageE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_messageE" runat="server" Text='<%#Bind ("message") %>' TextMode="multiline" Columns="40" Rows="20" />
                    <asp:RequiredFieldValidator ID="rfv_messageE" runat="server" ControlToValidate="txt_messageE" ErrorMessage="Message is required." Display="None" ValidationGroup="edit" />
                </td> 
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>&nbsp;</td>
                <td>
             
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" ValidationGroup="edit" CssClass="adminbuttons" />
                    <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="edit" CausesValidation="false" CssClass="adminbuttons" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ValidationSummary ID="vds_edit" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="edit" />
        </table>
            <br />
            <br />


</asp:Content>


