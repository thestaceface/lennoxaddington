<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ps_thanksformADMIN.aspx.cs" Inherits="ps_thanksformADMIN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Messages">
        <table border="1" style="font-family:Arial;border:1px solid #C0C0C0;background-color:#D8D8D8">
            <thead>
                <tr style="background-color:#6aabbf">
                    <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
                    <th><asp:Label ID="lbl_name" runat="server" Text="Sent By" /></th>
                    <th><asp:Label ID="lbl_email" runat="server" Text="Sent by - Email" /></th>      
                    <th><asp:Label ID="lbl_smname" runat="server" Text="Sent To" /></th>
                    <th><asp:Label ID="lbl_msg" runat="server" Text="Message" /></th>
                    <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
                    <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpt_all" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("th_date") %>
                            </td>                      
                            
                             <td>
                                <%#Eval("th_name") %>
                            </td>
                             <td>
                                <%#Eval("th_eml") %>
                            </td>
                             <td>
                                <%#Eval("th_smname") %>
                            </td>
                             <td>
                                <%#Eval("th_msg") %>
                            </td>
                             <td>
                              <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("th_id") %>' OnCommand="subAdmin" />
                            </td>
                            <td><asp:LinkButton ID="btn_forward" runat="server" Text="Reply Back" CommandName="Update" OnCommand="subAdmin"  CommandArgument='<%#Eval("th_id") %>'/></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Message">
        <table>
            <thead>
               
            </thead><asp:Repeater ID="rpt_update" runat="server" OnItemCommand="sendEmail">
                <ItemTemplate>
                    <tr>
                        <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("th_id") %>' />
                          
                         
                         <tr>
                                <td>
                                    <asp:Label ID="lbl_to" runat="server" Text="To:      " />
                                    <asp:TextBox ID="txt_to" runat="server" Text='<%#Eval("th_name") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_to" runat="server" Text="*Required" ControlToValidate="txt_to" ValidationGroup="send" />
                                </td>
                            </tr>

                         <tr>
                                <td>
                                    <asp:Label ID="lbl_from" runat="server" Text="From:      " />
                                    <asp:TextBox ID="txt_from" runat="server" Text='<%#Eval("th_smname") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ControlToValidate="txt_from" ValidationGroup="send" />
                                </td>
                            </tr>
                         <tr>
                                <td>
                                    <asp:Label ID="lbl_smEmail" runat="server" Text="Email:      " />
                                    <asp:TextBox ID="txt_smEmail" runat="server" Text='<%#Eval("th_eml") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_smEmail" ValidationGroup="send" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>
                          <tr>
                                <td>
                                    <asp:Label ID="lbl_smMsg" runat="server" Text="Message:" />
                                    <asp:TextBox ID="txt_smMsg" runat="server" Rows="10" Columns="50" TextMode="MultiLine" Text="Thanks for the appreciation" />
                                    <asp:RequiredFieldValidator ID="rfv_msg" runat="server" Text="*Required" ControlToValidate="txt_smMsg" ValidationGroup="send" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>
                    <tr>
                         <asp:Label ID="send" runat="server" />
                        <td colspan="3"><asp:Button ID="btn_send" runat="server" Text="Send" CommandName="Send" ValidationGroup="send" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                        </td>
                    </tr>
                </ItemTemplate>
                    </asp:Repeater>
            <tbody>

            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Message">
        <table>
            <thead>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this message?" />
                    </td>
                </tr>
                <tr>
                    <th><asp:Label ID="lbl_dateD" runat="server" Text="Date" /></th>
                    <th><asp:Label ID="lbl_emailD" runat="server" Text="Email" /></th>
                    <th><asp:Label ID="lbl_deptD" runat="server" Text="Department" /></th>
                    <th><asp:Label ID="lbl_sentbyD" runat="server" Text="Sent By" /></th>
                    <th><asp:Label ID="lbl_senttoD" runat="server" Text="Sent To" /></th>
                    <th><asp:Label ID="lbl_msgD" runat="server" Text="Message" /></th>
               </tr>
           </thead>
            <tbody>
                <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <td><asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("th_id") %>' /></td>
                            <td><asp:Label ID="txt_dateD" runat="server" Text='<%#Eval("th_date") %>' /></td>
                            <td><asp:Label ID="txt_emlD" runat="server" Text='<%#Eval("th_eml") %>' /></td>
                            <td><asp:Label ID="txt_nameD" runat="server" Text='<%#Eval("th_name") %>' /></td>
                           
                            <td><asp:Label ID="th_smnameD" runat="server" Text='<%#Eval("th_smname") %>' /></td>
                            <td><asp:Label ID="th_msgD" runat="server" Text='<%#Eval("th_msg") %>' /></td>
                        </tr>
                        <td colspan="3">
                            <asp:Button  ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </td> 
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Panel>
</asp:Content>

