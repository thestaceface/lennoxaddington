<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ps_SlideImagesADMIN.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    
    <asp:Label ID="lbl_insert" runat="server" Text="Insert New Image" Font-Bold="true" />
    <br /><br />
   
    <asp:Label ID="lbl_nameI" runat="server" Text="Name" AssociatedControlID="txt_nameI" /><br />
    <asp:TextBox ID="txt_nameI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_nameI" ValidationGroup="insert" /><br /><br />
    <asp:Label ID="lbl_pathI" runat="server" Text="Path" AssociatedControlID="txt_pathI" /><br />
    <asp:TextBox ID="txt_pathI" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_pathI" runat="server" ControlToValidate="txt_pathI" Text="*Required" ValidationGroup="insert" /><br /><br />
    <asp:Label ID="lbl_descI" runat="server" Text="Description" AssociatedControlID="txt_descI" /><br />
    <asp:TextBox ID="txt_descI" runat="server" TextMode="MultiLine" />
    <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="txt_descI" ValidationGroup="insert" />
    <br /><br />
    <br />
    <asp:FileUpload ID="fileupload1" runat="server" />
    <asp:RequiredFieldValidator ID="rfv_file" runat="server" Text="*Required" ControlToValidate="fileupload1" ValidationGroup="apply" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fileupload1" ErrorMessage="Please select a .jpeg or .gif or .png file" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
    <br /><br />
    <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" OnClick="Click" ValidationGroup="insert" /><br /><br />
            
    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Images">
        <table>
            <thead>
                <tr>
                    <th><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                    <th><asp:Label ID="lbl_path" runat="server" Text="Path" /></th>
                    <th><asp:Label ID="lbl_desc" runat="server" Text="Description" /></th>
                    <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
                    <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="dtl_all" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("sl_name") %></td>
                            <td><%#Eval("sl_path") %></td>
                            <td><%#Eval("sl_desc") %></td>
                            <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" OnCommand="subAdmin" CommandArgument='<%#Eval("sl_id") %>' /></td>
                          <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnCommand="subAdmin" CommandArgument='<%#Eval("sl_id") %>' /></td>
                        </tr>
                    </ItemTemplate>
               </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>  
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Image">
        <table>
            <thead>
                <tr>                   
                   <th><asp:Label ID="lbl_nameU" runat="server" Text="Name" /></th>                 
                    <th><asp:Label ID="lbl_pathU" runat="server" Text="Path" /></th>
                    <th><asp:Label ID="lbl_descU" runat="server" Text="Description" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="dtl_update" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <td><asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("sl_id") %>' />
                                <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("sl_name") %>' />
                            </td>
                            <td><asp:TextBox ID="txt_pathU" runat="server" Text='<%#Eval("sl_path") %>' /></td>

                          <td>  <asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("sl_desc") %>' TextMode="MultiLine" /></td>
                            
                           
                        </tr>
                        <tr>
                            <td><asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" /></td>
                            <td><asp:RequiredFieldValidator ID="rfv_descU" runat="server" Text="*required" ControlToValidate="txt_descU" ValidationGroup="update" /></td>
                            <td><asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel> 
    <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete">
        <table>
            <thead>
                <tr>
                    <td><asp:Label ID="lbl_delete" runat="server" Text="Are you sure?" /></td>
                </tr>
                <tr>
                   
                    <th><asp:Label ID="lbl_nameD" runat="server" Text="Name" /></th>
                    <th><asp:Label ID="lbl_pathD" runat="server" Text="Path" /></th>
                    
                    <th><asp:Label ID="lbl_descD" runat="server" Text="Description" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="dtl_delete" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <td><asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("sl_id") %>' />
                               <asp:Label ID="txt_nameD" runat="server" Text='<%#Eval("sl_name") %>' /></td>
                       <td>         <asp:Label ID="txt_pathD" runat="server" Text='<%#Eval("sl_path") %>' /></td>
                          <td>      <asp:Label ID="txt_descD" runat="server" Text='<%#Eval("sl_desc") %>' />

                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel> 
    <asp:Label ID="lbl_msg" runat="server" />
    <asp:ValidationSummary ID="vds_insert" runat="server" ShowMessageBox="true" HeaderText="Please Note:" ValidationGroup="insert" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_footer" Runat="Server">
</asp:Content>

