<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="db_donationAdmin.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- label to confirm update/delete/insert --%>
    <asp:Label ID="lbl_message" runat="server" />

    <%-- donation panel --%>
    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Donations">
            <table>
                <thead>
                    <tr>
                        <%-- name address phone email amount and options labels --%>
                        <th><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                        <th><asp:Label ID="lbl_address" runat="server" Text="Address" /></th>
                        <th><asp:Label ID="lbl_phone" runat="server" Text="Phone" /></th>
                        <th><asp:Label ID="lbl_email" runat="server" Text="Email" /></th>
                        <th><asp:Label ID="lbl_amount" runat="server" Text="Amount" /></th>
                        <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
                        <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                    </tr>
                </thead>
                <tbody>
                    <%-- repeater to display address, name, tel, email, amount --%>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                <%-- eval --%>
                                <td><%#Eval("dn_title") %> <%#Eval("dn_first") %> <%#Eval("dn_last") %></td>
                                <td><%#Eval("dn_street") %> <%#Eval("dn_apt") %> <%#Eval("dn_city") %> <%#Eval("dn_province") %> <%#Eval("dn_country") %> <%#Eval("dn_postal") %></td>
                                <td><%#Eval("dn_tel") %></td>
                                <td><%#Eval("dn_email") %></td>
                                <td><%#Eval("dn_amount") %></td>

                                <%-- linkbuttons to update and delete --%>
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("dn_id") %>' OnCommand="subAdmin" /></td>
                                <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("dn_id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

    <%-- update donation panel --%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Donation Record">
            <table class="tables">
                <tbody>
                    <%-- repeater for update --%>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%-- id - title label/textbox --%>
                                    <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("dn_id") %>' />
                                    <asp:Label ID="lbl_titleU" runat="server" Text="Title*" /> <br />
                                    <asp:TextBox ID="txt_titleU" runat="server" Text='<%#Eval("dn_title") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_titleU" runat="server" Text="*Required" ControlToValidate="txt_titleU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- first name --%>
                                    <asp:Label ID="lbl_fnameU" runat="server" Text="First Name*" /><br />
                                    <asp:TextBox ID="txt_fnameU" runat="server" Text='<%#Eval("dn_first") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_fnameU" runat="server" Text="*Required" ControlToValidate="txt_fnameU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- last name --%>
                                    <asp:Label ID="lbl_lnameU" runat="server" Text="Last Name*" /><br />
                                    <asp:TextBox ID="txt_lnameU" runat="server" Text='<%#Eval("dn_last") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_lnameU" runat="server" Text="*Required" ControlToValidate="txt_lnameU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- tel --%>
                                    <asp:Label ID="lbl_telU" runat="server" Text="Tel*" /><br />
                                    <asp:TextBox ID="txt_telU" runat="server" Text='<%#Eval("dn_tel") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_telU" runat="server" Text="*Required" ControlToValidate="txt_telU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- mobile --%>
                                    <asp:Label ID="lbl_mobU" runat="server" Text="Mobile*" /><br />
                                    <asp:TextBox ID="txt_celU" runat="server" Text='<%#Eval("dn_cell") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_celU" runat="server" Text="*Required" ControlToValidate="txt_celU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- street --%>
                                    <asp:Label ID="lbl_streetU" runat="server" Text="Street*" /><br />
                                    <asp:TextBox ID="txt_streetU" runat="server" Text='<%#Eval("dn_street") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_streetU" runat="server" Text="*Required" ControlToValidate="txt_streetU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- apartment number --%>
                                    <asp:Label ID="lbl_aptU" runat="server" Text="Apartment Number" /><br />
                                    <asp:TextBox ID="txt_aptU" runat="server" Text='<%#Eval("dn_apt") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- city --%>
                                    <asp:Label ID="lbl_cityU" runat="server" Text="City*" /><br />
                                    <asp:TextBox ID="txt_cityU" runat="server" Text='<%#Eval("dn_city") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_cityU" runat="server" Text="*Required" ControlToValidate="txt_cityU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- province --%>
                                    <asp:Label ID="lbl_provinceU" runat="server" Text="Province*" /><br />
                                    <asp:TextBox ID="txt_provinceU" runat="server" Text='<%#Eval("dn_province") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_provinceU" runat="server" Text="*Required" ControlToValidate="txt_provinceU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- country --%>
                                    <asp:Label ID="lbl_countryU" runat="server" Text="Country*" /><br />
                                    <asp:TextBox ID="txt_countryU" runat="server" Text='<%#Eval("dn_country") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_countryU" runat="server" Text="*Required" ControlToValidate="txt_countryU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- amount --%>
                                    <asp:Label ID="lbl_amountU" runat="server" Text="Amount*" /><br />
                                    <asp:TextBox ID="txt_amountU" runat="server" Text='<%#Eval("dn_amount") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_amountU" runat="server" Text="*Required" ControlToValidate="txt_amountU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- postal --%>
                                    <asp:Label ID="lbl_postalU" runat="server" Text="Postal*" /><br />
                                    <asp:TextBox ID="txt_postalU" runat="server" Text='<%#Eval("dn_postal") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_postalU" runat="server" Text="*Required" ControlToValidate="txt_postalU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- email --%>
                                    <asp:Label ID="lbl_emailU" runat="server" Text="Email*" /><br />
                                    <asp:TextBox ID="txt_emailU" runat="server" Text='<%#Eval("dn_email") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_emailU" runat="server" Text="*Required" ControlToValidate="txt_emailU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- transaction --%>
                                    <asp:Label ID="lbl_tranU" runat="server" Text="Transaction*" /><br />
                                    <asp:TextBox ID="txt_tranU" runat="server" Text='<%#Eval("dn_transaction") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_tranU" runat="server" Text="*Required" ControlToValidate="txt_tranU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <%-- update and cancel --%>
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

    <%-- delete panel --%>
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Product">
            <table class="tables" style="width:100%;">
                <thead>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lbl_delete" runat="server" Text="Delete product?" />
                        </td>
                    </tr>
                    <tr>
                        <%-- name address phone mobile email amount labels --%>
                        <td><asp:Label ID="lbl_nameD" runat="server" Text="Name" /></td>
                        <td><asp:Label ID="lbl_addD" runat="server" Text="Address" /></td>
                        <td><asp:Label ID="lbl_phoneD" runat="server" Text="Phone" /></td>
                        <td><asp:Label ID="lbl_mobD" runat="server" Text="Mobile" /></td>
                        <td><asp:Label ID="lbl_emailD" runat="server" Text="Email" /></td>
                        <td><asp:Label ID="lbl_amtD" runat="server" Text="Amount" /></td>
                    </tr>
                </thead>
                <tbody>
                    <%-- delete repeater --%>
                    <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%-- name address phone mobile email amount labels binding --%>
                                    <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("dn_id") %>' />
                                    <asp:Label ID="lbl_nameD" runat="server" Text='<%#Eval("dn_title") %>' />
                                </td>
                                <td><asp:Label ID="lbl_addD" runat="server" Text='<%#Eval("dn_street") %>' /></td>
                                <td><asp:Label ID="lbl_phoneD" runat="server" Text='<%#Eval("dn_tel") %>' /></td>
                                <td><asp:Label ID="lbl_mobD" runat="server" Text='<%#Eval("dn_cell") %>' /></td>
                                <td><asp:Label ID="lbl_emailD" runat="server" Text='<%#Eval("dn_email") %>' /></td>
                                <td><asp:Label ID="lbl_amtD" runat="server" Text='<%#Eval("dn_amount") %>' /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <%-- delete and cancel buttons --%>
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

