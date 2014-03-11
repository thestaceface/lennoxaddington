<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="career.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">


    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Products">
            <table>
                <thead>
                    <tr>
                        <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
                        <th><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                        <th><asp:Label ID="lbl_type" runat="server" Text="Type" /></th>
                        <th><asp:Label ID="lbl_view" runat="server" Text="View" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("pn_s_date", "{0:d}") %></td>
                                <td><%#Eval("pn_name") %></td>
                                <td><%#Eval("pn_type") %></td>
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="View" CommandName="Update" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>


    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Product">
            <table>
                <thead>
                    <tr>
                        <%--<th><asp:Label ID="lbl_nameU" runat="server" Text="Job Description" /></th>--%>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server">
                        <ItemTemplate>
                            <tr>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("pn_id") %>' />
                                
                                <td>
                                    <asp:Label ID="lbl_name" runat="server" Text="Name: " />
                                    <%#Eval("pn_name") %>
                                </td> <br /><br />
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_date" runat="server" Text="Date" />
                                    <%#Eval("pn_s_date", "{0:d}") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_type" runat="server" Text="Type" />
                                    <%#Eval("pn_type") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_desc" runat="server" Text="Description" />
                                    <%#Eval("pn_desc") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_req" runat="server" Text="Requirement" />
                                    <%#Eval("pn_requirements") %>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_qua" runat="server" Text="Qualification" />
                                    <%#Eval("pn_qualification") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_education" runat="server" Text="Education" />
                                    <%#Eval("pn_education") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_exp" runat="server" Text="Experience" />
                                    <%#Eval("pn_experience") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_spec" runat="server" Text="Specialities" />
                                    <%#Eval("pn_specialities") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_appName" runat="server" Text="Name:      " />
                                    <asp:TextBox ID="txt_appName" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_appEmail" runat="server" Text="Email:      " />
                                    <asp:TextBox ID="txt_appEmail" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_appMsg" runat="server" Text="Cover Letter:      " />
                                    <asp:TextBox ID="txt_appMsg" runat="server" Rows="5" TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fileupload1" runat="server" />
                
                                    <%--<asp:Button ID="button1" Text="Upload" runat="server" Width="73px" OnClick="button1_Click" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete"  />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel"  />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>


</asp:Content>

