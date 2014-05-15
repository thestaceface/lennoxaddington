<%@ Page Language="C#" MasterPageFile="~/framework.master"  AutoEventWireup="true" CodeFile="newsletterADMIN.aspx.cs" Inherits="newsletterADMIN" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

     <asp:Label ID="lbl_edit" runat="server" Text="Update Existing Record" Font-Underline="true" />
        <br />
        <br />
        <asp:Label ID="lbl_req2" runat="server" text="Fields marked with * are required." />
        <br />
        <br />

        <table class="tables">
            <tr>
                <td>
                    <asp:Label ID="lbl_fnameI" runat="server" Text="First Name:*" AssociatedControlID="txt_fnameI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_fnameI" runat="server" Columns="40" />
                <%--    <asp:RequiredFieldValidator ID="rfv_subjectE" runat="server" ControlToValidate="txt_subjectE" ErrorMessage="Subject is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lnameI" runat="server" Text="Last Name:*" AssociatedControlID="txt_lnameI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lnameI" runat="server" Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_emailI" runat="server" Text="Email:*" AssociatedControlID="txt_emailI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailI" runat="server" ToolTip="Format: email@email.com" Columns="40" />
                    <%--<asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />--%>
                </td>
            </tr>

            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>
          
             
                    
                    <asp:Button ID="btn_insert" runat="server" Text="Insert New Record" OnClick="subInsert" CssClass="adminbuttons" />
                    <asp:Button ID="btn_insertC" runat="server" Text="Cancel" onClick="subCancel" CausesValidation="false" CssClass="adminbuttons" />

         </td></tr>
        </table>
    <br />







        <table class="tables">
            <asp:label runat="server" ID="lbl_msg"/> 

            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
          
            <tr>
                <td>
                    <asp:Label ID="lbl_lastE" runat="server" Text="Last Name:*" AssociatedControlID="txt_lastE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("Id") %>' />
                    <asp:TextBox ID="txt_lastE" runat="server" Text='<%#Bind ("lname") %>' Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_nameE" runat="server" Text="First Name:*" AssociatedControlID="txt_firstE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_firstE" runat="server" Text='<%#Bind ("fname") %>' Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_firstE" runat="server" ControlToValidate="txt_firstE" ErrorMessage="First name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_emailE" runat="server" Text="Email:*" AssociatedControlID="txt_emailE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("email") %>' ToolTip="Format: email@email.com" Columns="40" />
                    <%--<asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" ErrorMessage="Email is required." Display="None" ValidationGroup="edit" />
                    <asp:RegularExpressionValidator ID="reg_emailE" runat="server" ControlToValidate="txt_emailE" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Please enter a valid email address. Ex: email@hospital.com" Display="none" ValidationGroup="edit" />--%>
                </td>
            </tr>

           
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>
             
                    <asp:Button ID="btn_delete" runat="server" Text="Delete Record" CommandName="Delete" CssClass="adminbuttons" OnClientClick="return confirm('Delete?');" />
                    <asp:Button ID="btn_update" runat="server" Text="Update Record" CommandName="Update" CssClass="adminbuttons" />
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