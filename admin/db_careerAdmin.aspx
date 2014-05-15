<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="db_careerAdmin.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- message - successful or not --%>
        <asp:Label ID="lbl_message" runat="server" />
        <br /><br />

    <%-- insert new job --%>
        <asp:Label ID="lbl_insert" runat="server" Text="Insert New Job:" Font-Bold="true" />
        <br />

    <%-- description textbox + validation --%>
        <asp:Label ID="lbl_descI" runat="server" Text="Description" AssociatedControlID="txt_descI" />
        <br />
        <asp:TextBox ID="txt_descI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" Text="*Required" ControlToValidate="txt_descI" ValidationGroup="insert" />
        <br />

    <%-- name textbox + validation --%>
        <asp:Label id="lbl_nameI" runat="server" Text="Name" AssociatedControlID="txt_nameI" />
        <br />
        <asp:TextBox ID="txt_nameI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" Text="*Required" ControlToValidate="txt_nameI" ValidationGroup="insert" />
        <br />

    <%-- type textbox + validation --%>
        <asp:Label id="lbl_typeI" runat="server" Text="Type" AssociatedControlID="txt_typeI" />
        <br />
        <asp:TextBox ID="txt_typeI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_typeI" runat="server" Text="*Required" ControlToValidate="txt_typeI" ValidationGroup="insert" />
        <br />

    <%-- date textbox + validation --%>
        <asp:Label id="lbl_dateI" runat="server" Text="Date" AssociatedControlID="txt_dateI" />
        <br />
        <asp:TextBox ID="txt_dateI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_date" runat="server" Text="*Required" ControlToValidate="txt_dateI" ValidationGroup="insert" />
        <br />

    <%-- qualification textbox + validation --%>
        <asp:Label id="lbl_qualificationI" runat="server" Text="Qualification" AssociatedControlID="txt_quaI" />
        <br />
        <asp:TextBox ID="txt_quaI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_qua" runat="server" Text="*Required" ControlToValidate="txt_quaI" ValidationGroup="insert" />
        <br />

    <%-- requirement textbox + validation --%>
        <asp:Label id="lbl_reqI" runat="server" Text="Requirement" AssociatedControlID="txt_reqI" />
        <br />
        <asp:TextBox ID="txt_reqI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_req" runat="server" Text="*Required" ControlToValidate="txt_reqI" ValidationGroup="insert" />
        <br />

    <%-- education textbox + validation --%>
        <asp:Label id="lbl_eduI" runat="server" Text="Education" AssociatedControlID="txt_eduI" />
        <br />
        <asp:TextBox ID="txt_eduI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_edu" runat="server" Text="*Required" ControlToValidate="txt_eduI" ValidationGroup="insert" />
        <br />

    <%-- experience textbox + validation --%>
        <asp:Label id="lbl_expI" runat="server" Text="Experience" AssociatedControlID="txt_expI" />
        <br />
        <asp:TextBox ID="txt_expI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_exp" runat="server" Text="*Required" ControlToValidate="txt_expI" ValidationGroup="insert" />
        <br />

    <%-- specialities textbox + validation --%>
        <asp:Label ID="lbl_specI" runat="server" Text="Specialities" AssociatedControlID="txt_specI" />
        <br />
        <asp:TextBox ID="txt_specI" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="rfv_specI" runat="server" Text="*Required" ControlToValidate="txt_specI" ValidationGroup="insert" />
        <br />

    <%-- insert button --%>
        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="insert" />
        <br /><br />

    <%-- job opportunities panel --%>
        <asp:Panel ID="pnl_all" runat="server" GroupingText="CURRENT CAREER OPPORTUNITIES">
            <table style="width:100%; text-align:center;">
                <thead>
                    <tr>
                        <%-- headings --%>
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
                                <%-- date, name and description list - update and delete link button --%>
                                <td><%#Eval("pn_s_date","{0:d}") %></td>
                                <td style="text-align:left;"><%#Eval("pn_name") %></td>
                                <td style="text-align:left;"><%#Eval("pn_desc") %></td>
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
                                <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

    <%-- update job panel --%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Job">
            <table>
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <%-- hidden field for id --%>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("pn_id") %>' />
                                <td>
                                    <%-- description textbox and validation for update --%>
                                    <asp:Label ID="lbl_descU" runat="server" Text="Description" /><br />
                                    <asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("pn_desc") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_descU" runat="server" Text="*Required" ControlToValidate="txt_descU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- name textbox and validation for update --%>
                                    <asp:Label ID="lbl_nameU" runat="server" Text="Job Title" /><br />
                                    <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("pn_name") %>' TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <%-- type textbox and validation for update --%>
                                    <asp:Label ID="lbl_typeU" runat="server" Text="Type" /><br />
                                    <asp:TextBox ID="txt_typeU" runat="server" Text='<%#Eval("pn_type") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_typeU" runat="server" Text="*Required" ControlToValidate="txt_typeU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- date textbox and validation for update --%>
                                    <asp:Label ID="lbl_dateU" runat="server" Text="Date" /><br />
                                    <asp:TextBox ID="txt_dateU" runat="server" Text='<%#Eval("pn_s_date") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*Required" ControlToValidate="txt_dateU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- qualification textbox and validation for update --%>
                                    <asp:Label ID="lbl_quaU" runat="server" Text="Qualification" /><br />
                                    <asp:TextBox ID="txt_quaU" runat="server" Text='<%#Eval("pn_qualification") %>' TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_quaU" runat="server" Text="*Required" ControlToValidate="txt_quaU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- requirement textbox and validation for update --%>
                                    <asp:Label ID="lbl_reqU" runat="server" Text="Requirement" /><br />
                                    <asp:TextBox ID="txt_reqU" runat="server" Text='<%#Eval("pn_requirements") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_reqU" runat="server" Text="*Required" ControlToValidate="txt_reqU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- education textbox and validation for update --%>
                                    <asp:Label ID="lbl_eduU" runat="server" Text="Education" /><br />
                                    <asp:TextBox ID="txt_eduU" runat="server" Text='<%#Eval("pn_education") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_eduU" runat="server" Text="*Required" ControlToValidate="txt_eduU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- experience textbox and validation for update --%>
                                    <asp:Label ID="lbl_expU" runat="server" Text="Experience" /><br />
                                    <asp:TextBox ID="txt_expU" runat="server" Text='<%#Eval("pn_experience") %>' TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_expU" runat="server" Text="*Required" ControlToValidate="txt_expU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- specialities textbox and validation for update --%>
                                    <asp:Label ID="lbl_specU" runat="server" Text="Specialities" /><br />
                                    <asp:TextBox ID="txt_specU" runat="server" Text='<%#Eval("pn_specialities") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_specU" runat="server" Text="*Required" ControlToValidate="txt_specU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <%-- update and cancel button --%>
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
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Delete Job">
            <table>
                <thead>
                    <tr>
                        <td colspan="9">
                            <%-- delete confirmation message --%>
                            <asp:Label ID="lbl_delete" runat="server" Text="Delete Job?" />
                        </td>
                    </tr>
                    <tr>
                        <%-- headings --%>
                        <th><asp:Label ID="lbl_descD" runat="server" Text="Description" /></th>
                        <th><asp:Label ID="lbl_titleD" runat="server" Text="Job Title" /></th>
                        <th><asp:Label ID="lbl_typeD" runat="server" Text="Type" /></th>
                        <th><asp:Label ID="lbl_dateD" runat="server" Text="Date" /></th>
                    </tr>
                </thead>
                <tbody>
                    <%-- repeater for delete --%>
                    <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%-- details of job to be delete - hidden field id, description, name, type and date --%>
                                    <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("pn_id") %>' />
                                    <asp:Label ID="txt_nameD" runat="server" Text='<%#Eval("pn_desc") %>' />
                                </td>
                                <td><asp:Label ID="txt_descD" runat="server" Text='<%#Eval("pn_name") %>' /></td>
                                <td><asp:Label ID="txt_priceD" runat="server" Text='<%#Eval("pn_type") %>' /></td>
                                <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("pn_s_date") %>' /></td>
                            </tr>
                            <tr>
                                <td colspan="3">
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

    <%-- Applicant Details --%>
    <%-- applicant details panel --%>
    <asp:Panel ID="pnl_Appliall" runat="server" GroupingText="Applicant Details">
            <table style="width:100%; text-align:center;">
                <thead>
                    <tr>
                        <%-- headings --%>
                        <th><asp:Label ID="lbl_nameA" runat="server" Text="Name" /></th>
                        <th><asp:Label ID="lbl_emailA" runat="server" Text="Email" /></th>
                        <th><asp:Label ID="lbl_letterA" runat="server" Text="Letter" /></th>
                        <%--<th><asp:Label ID="Label12" runat="server" Text="Resume" /></th>--%>
                        <th><asp:Label ID="lbl_optionA1" runat="server" Text="Option" /></th>
                        <th><asp:Label ID="lbl_optionA2" runat="server" Text="Option" /></th>
                    </tr>
                </thead>
                <tbody>
                    <%-- applicant repeater --%>
                    <asp:Repeater ID="rpt_Appliall" runat="server">
                        <ItemTemplate>
                            <tr>
                                <%-- name, email, letter details --%>
                                <td style="text-align:left;"><%#Eval("ap_name") %></td>
                                <td style="text-align:left;"><%#Eval("ap_email") %></td>
                                <td style="text-align:left;"><%#Eval("ap_letter") %></td>
                                <%--<td style="text-align:left;"><%#Eval("ap_upload") %></td>--%>

                                <%-- update and delete buttons --%>
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("ap_id") %>' OnCommand="subAdminAppli" /></td>
                                <td><asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("ap_id") %>' OnCommand="subAdminAppli" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

    <%-- update job panel --%>
        <asp:Panel ID="pnl_Appliupdate" runat="server" GroupingText="Update Job">
            <table>
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_Appliupdate" runat="server" OnItemCommand="subUpDel2">
                        <ItemTemplate>
                            <tr>
                                <%-- hidden field for id --%>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("ap_id") %>' />
                                <td>
                                    <%-- description textbox with validation for update --%>
                                    <asp:Label ID="lbl_descU" runat="server" Text="Description" /><br />
                                    <asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("ap_name") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_descU" runat="server" Text="*Required" ControlToValidate="txt_descU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- email textbox with validation for update --%>
                                    <asp:Label ID="lbl_nameU" runat="server" Text="Job Title" /><br />
                                    <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("ap_email") %>' TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <%-- letter textbox with validation for update --%>
                                    <asp:Label ID="lbl_typeU" runat="server" Text="Type" /><br />
                                    <asp:TextBox ID="txt_typeU" runat="server" Text='<%#Eval("ap_letter") %>' TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_typeU" runat="server" Text="*Required" ControlToValidate="txt_typeU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <asp:Label ID="lbl_dateU" runat="server" Text="Date" /><br />
                                    <asp:TextBox ID="txt_dateU" runat="server" Text='<%#Eval("ap_upload") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*Required" ControlToValidate="txt_dateU" ValidationGroup="update" />
                                </td>
                            </tr>--%>
                            <tr>
                                <td colspan="3">
                                    <%-- update and cancel buttons --%>
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
        <asp:Panel ID="pnl_Applidelete" runat="server" GroupingText="Delete Job">
            <table>
                <thead>
                    <tr>
                        <td colspan="9">
                            <%-- delete text confirmation --%>
                            <asp:Label ID="lbl_deleteJob" runat="server" Text="Delete Job?" />
                        </td>
                    </tr>
                    <tr>
                        <%-- headings --%>
                        <th><asp:Label ID="lbl_nameD" runat="server" Text="Name" /></th>
                        <th><asp:Label ID="lbl_emailD" runat="server" Text="Email" /></th>
                        <th><asp:Label ID="lbl_letterD" runat="server" Text="Cover Letter" /></th>
                        <%--<th><asp:Label ID="Label11" runat="server" Text="Resume" /></th>--%>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_Applidelete" runat="server" OnItemCommand="subUpDel2">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%-- details for job --%>
                                    <asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("ap_id") %>' />
                                    <asp:Label ID="txt_nameD" runat="server" Text='<%#Eval("ap_name") %>' />
                                </td>
                                <td><asp:Label ID="txt_descD" runat="server" Text='<%#Eval("ap_email") %>' /></td>
                                <td><asp:Label ID="txt_priceD" runat="server" Text='<%#Eval("ap_letter") %>' /></td>
                                <%--<td><asp:Label ID="Label5" runat="server" Text='<%#Eval("ap_upload") %>' /></td>--%>
                            </tr>
                            <tr>
                                <td colspan="3">
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

