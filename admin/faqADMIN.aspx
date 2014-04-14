<%@ Page Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="faqADMIN.aspx.cs" Inherits="faqADMIN" EnableEventValidation="false" %>

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
                    <asp:Label ID="lbl_categoryI" runat="server" Text="Category:*" AssociatedControlID="txt_categoryI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_categoryI" runat="server" Columns="40" />
                <%--    <asp:RequiredFieldValidator ID="rfv_subjectE" runat="server" ControlToValidate="txt_subjectE" ErrorMessage="Subject is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_questionI" runat="server" Text="Question:*" AssociatedControlID="txt_questionI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_questionI" runat="server" Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_answerI" runat="server" Text="Answer:*" AssociatedControlID="txt_answerI" />
                </td>
                <td>
                    <asp:TextBox ID="txt_answerI" runat="server" Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_firstE" runat="server" ControlToValidate="txt_firstE" ErrorMessage="First name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>
             
                    
                    <asp:Button ID="btn_insert" runat="server" Text="Insert Record" OnClick="subInsert" CssClass="adminbuttons" />
                    <asp:Button ID="btn_insertC" runat="server" Text="Cancel" onClick="subCancel" CausesValidation="false" CssClass="adminbuttons" />
                </td></tr>
        </table>








        <table class="tables">
           <asp:label runat="server" ID="lbl_msg"/> 

            <asp:Repeater ID="rpt_edit" runat="server" OnItemCommand="subUpDel">
                <ItemTemplate>
          
            <tr>    
                 <td>
                     <asp:Label ID="lbl_categoryE" runat="server" Text="Category:*" AssociatedControlID="txt_categoryE" />
                </td>
                <td>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval ("fa_id") %>' />
                    <asp:TextBox ID="txt_categoryE" runat="server" Text='<%#Bind ("fa_category") %>' Columns="40" />
                <%--    <asp:RequiredFieldValidator ID="rfv_subjectE" runat="server" ControlToValidate="txt_subjectE" ErrorMessage="Subject is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_questionE" runat="server" Text="Question:*" AssociatedControlID="txt_questionE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_questionE" runat="server" Text='<%#Bind ("fa_question") %>' Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_lastE" runat="server" ControlToValidate="txt_lastE" ErrorMessage="Last name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_answerE" runat="server" Text="Answer:*" AssociatedControlID="txt_answerE" />
                </td>
                <td>
                    <asp:TextBox ID="txt_answerE" runat="server" Text='<%#Bind ("fa_answer") %>' Columns="40" />
                   <%-- <asp:RequiredFieldValidator ID="rfv_firstE" runat="server" ControlToValidate="txt_firstE" ErrorMessage="First name is required." Display="None" ValidationGroup="edit" />--%>
                </td>
            </tr>
            
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td>
                <td>
             
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


