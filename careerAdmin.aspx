<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="careerAdmin.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Label ID="lbl_message" runat="server" />
        <br /><br />
        <asp:Label ID="lbl_insert" runat="server" Text="Insert New Product:" Font-Bold="true" />
        <br />

        <asp:Label ID="lbl_descI" runat="server" Text="Description" AssociatedControlID="txt_descI" />
        <br />
        <asp:TextBox ID="txt_descI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="txt_descI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_nameI" runat="server" Text="Name" AssociatedControlID="txt_nameI" />
        <br />
        <asp:TextBox ID="txt_nameI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_nameI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_typeI" runat="server" Text="Type" AssociatedControlID="txt_typeI" />
        <br />
        <asp:TextBox ID="txt_typeI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_typeI" runat="server" Text="*Required" ControlToValidate="txt_typeI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_dateI" runat="server" Text="Date" AssociatedControlID="txt_dateI" />
        <br />
        <asp:TextBox ID="txt_dateI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_date" runat="server" Text="*Required" ControlToValidate="txt_dateI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_qualificationI" runat="server" Text="Qualification" AssociatedControlID="txt_quaI" />
        <br />
        <asp:TextBox ID="txt_quaI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_qua" runat="server" Text="*Required" ControlToValidate="txt_quaI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_reqI" runat="server" Text="Requirement" AssociatedControlID="txt_reqI" />
        <br />
        <asp:TextBox ID="txt_reqI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_req" runat="server" Text="*Required" ControlToValidate="txt_reqI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_eduI" runat="server" Text="Education" AssociatedControlID="txt_eduI" />
        <br />
        <asp:TextBox ID="txt_eduI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_edu" runat="server" Text="*Required" ControlToValidate="txt_eduI" ValidationGroup="insert" />
        <br />

        <asp:Label id="lbl_expI" runat="server" Text="Experience" AssociatedControlID="txt_expI" />
        <br />
        <asp:TextBox ID="txt_expI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_exp" runat="server" Text="*Required" ControlToValidate="txt_expI" ValidationGroup="insert" />
        <br />

        <asp:Label ID="lbl_specI" runat="server" Text="Specialities" AssociatedControlID="txt_specI" />
        <br />
        <asp:TextBox ID="txt_specI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_specI" runat="server" Text="*Required" ControlToValidate="txt_specI" ValidationGroup="insert" />
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" />
        <br /><br />

        <asp:Panel ID="pnl_all" runat="server" GroupingText="All Products">
            <table>
                <thead>
                    <tr>
                        <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
                        <th><asp:Label ID="lbl_title" runat="server" Text="Job Title" /></th>
                        <th><asp:Label ID="lbl_desc" runat="server" Text="Description" /></th>
                        <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
                        <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("pn_s_date") %></td>
                                <td><%#Eval("pn_name") %></td>
                                <td><%#Eval("pn_desc") %></td>
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
                                <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
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
                        <th><asp:Label ID="lbl_descU" runat="server" Text="Description" /></th>
                        <th><asp:Label ID="lbl_nameU" runat="server" Text="Job Title" /></th>
                        <th><asp:Label ID="lbl_typeU" runat="server" Text="Type" /></th>
                        <th><asp:Label ID="lbl_dateU" runat="server" Text="Date" /></th>
                        <th><asp:Label ID="lbl_quaU" runat="server" Text="Qualification" /></th>
                        <th><asp:Label ID="lbl_reqU" runat="server" Text="Requirement" /></th>
                        <th><asp:Label ID="lbl_eduU" runat="server" Text="Education" /></th>
                        <th><asp:Label ID="lbl_expU" runat="server" Text="Experience" /></th>
                        <th><asp:Label ID="lbl_specU" runat="server" Text="Specialities" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("pn_id") %>' />
                                <td><asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("pn_desc") %>' /></td>
                                <td><asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("pn_name") %>' TextMode="MultiLine" /></td>
                                <td><asp:TextBox ID="txt_typeU" runat="server" Text='<%#Eval("pn_type") %>' /></td>
                                <td><asp:TextBox ID="txt_dateU" runat="server" Text='<%#Eval("pn_s_date") %>' /></td>
                                <td><asp:TextBox ID="txt_quaU" runat="server" Text='<%#Eval("pn_qualification") %>' TextMode="MultiLine" /></td>
                                <td><asp:TextBox ID="txt_reqU" runat="server" Text='<%#Eval("pn_requirements") %>' /></td>
                                <td><asp:TextBox ID="txt_eduU" runat="server" Text='<%#Eval("pn_education") %>' /></td>
                                <td><asp:TextBox ID="txt_expU" runat="server" Text='<%#Eval("pn_experience") %>' TextMode="MultiLine" /></td>
                                <td><asp:TextBox ID="txt_specU" runat="server" Text='<%#Eval("pn_specialities") %>' /></td>
                            </tr>
                            <tr>
                                <td><asp:RequiredFieldValidator ID="rfv_descU" runat="server" Text="*Required" ControlToValidate="txt_descU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_typeU" runat="server" Text="*Required" ControlToValidate="txt_typeU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*Required" ControlToValidate="txt_dateU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_quaU" runat="server" Text="*Required" ControlToValidate="txt_quaU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_reqU" runat="server" Text="*Required" ControlToValidate="txt_reqU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_eduU" runat="server" Text="*Required" ControlToValidate="txt_eduU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_expU" runat="server" Text="*Required" ControlToValidate="txt_expU" ValidationGroup="update" /></td>
                                <td><asp:RequiredFieldValidator ID="rfv_specU" runat="server" Text="*Required" ControlToValidate="txt_specU" ValidationGroup="update" /></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Product">
            <table>
                <thead>
                    <tr>
                        <td colspan="9">
                            <asp:Label ID="lbl_delete" runat="server" Text="Delete product?" />
                        </td>
                    </tr>
                    <tr>
                        <th><asp:Label ID="Label1" runat="server" Text="Description" /></th>
                        <th><asp:Label ID="Label2" runat="server" Text="Job Title" /></th>
                        <th><asp:Label ID="Label3" runat="server" Text="Type" /></th>
                        <th><asp:Label ID="Label4" runat="server" Text="Date" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("pn_id") %>' />
                                    <asp:Label ID="txt_nameD" runat="server" Text='<%#Eval("pn_desc") %>' />
                                </td>
                                <td><asp:Label ID="txt_descD" runat="server" Text='<%#Eval("pn_name") %>' /></td>
                                <td><asp:Label ID="txt_priceD" runat="server" Text='<%#Eval("pn_type") %>' /></td>
                                <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("pn_s_date") %>' /></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

</asp:Content>

