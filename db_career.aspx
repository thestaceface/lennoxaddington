<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="db_career.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- Page by Dharveen Beedah --%>

    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/careerAdmin.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- panel for jobs --%>
    <asp:Panel ID="pnl_all" runat="server" GroupingText="CURRENT CAREER OPPORTUNITIES">
            <%--<table style="width:100%; text-align:center;">--%>
            <table class="tables">
                <thead>
                    <tr>
                        <%-- headings --%>
                        <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
                        <th style="padding-left:30px;"><asp:Label ID="lbl_name" runat="server" Text="Name" /></th>
                        <th style="padding-left:30px;"><asp:Label ID="lbl_type" runat="server" Text="Type" /></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <%-- repeater for job --%>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                <%-- description and link to job description --%>
                                <td><%#Eval("pn_s_date", "{0:d}") %></td>
                                <td style="text-align:left; padding-left:30px;"><%#Eval("pn_name") %></td>
                                <td style="padding-left:30px;"><%#Eval("pn_type") %></td>
                                <td style="padding-left:80px;"><asp:LinkButton ID="btn_update" runat="server" Text="View Job" CommandName="Update" CommandArgument='<%#Eval("pn_id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

    <%-- job application panel --%>
    <%-- job details like name, date, description etc --%>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Job Application">
            <table class="tables">
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="sendEmail">
                        <ItemTemplate>
                            <tr>
                                <%-- hidden field for id --%>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("pn_id") %>' />
                                
                                <td>
                                    <%-- name --%>
                                    <asp:Label ID="lbl_name" runat="server" Text="Name: " />
                                    <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("pn_name") %>' />
                                </td> <br /><br />
                            </tr>
                            <tr>
                                <td>
                                    <%-- date --%>
                                    <asp:Label ID="lbl_date" runat="server" Text="Date: " />
                                    <%#Eval("pn_s_date", "{0:d}") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- type --%>
                                    <asp:Label ID="lbl_type" runat="server" Text="Type: " />
                                    <%#Eval("pn_type") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- Description --%>
                                    <asp:Label ID="lbl_desc" runat="server" Text="Description: " />
                                    <%#Eval("pn_desc") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- requirements --%>
                                    <asp:Label ID="lbl_req" runat="server" Text="Requirement: " />
                                    <%#Eval("pn_requirements") %>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- qualification --%>
                                    <asp:Label ID="lbl_qua" runat="server" Text="Qualification: " />
                                    <%#Eval("pn_qualification") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- education --%>
                                    <asp:Label ID="lbl_education" runat="server" Text="Education: " />
                                    <%#Eval("pn_education") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- experience --%>
                                    <asp:Label ID="lbl_exp" runat="server" Text="Experience: " />
                                    <%#Eval("pn_experience") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%-- specialities --%>
                                    <asp:Label ID="lbl_spec" runat="server" Text="Specialities: " />
                                    <%#Eval("pn_specialities") %>
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>
                            <tr><td><br /></td></tr>

                            <tr>
                                <td>
                                    <%-- input - name from user + validation --%>
                                    <asp:Label ID="lbl_appName" runat="server" Text="Name*:      " />
                                    <asp:TextBox ID="txt_appName" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ControlToValidate="txt_appName" ValidationGroup="apply" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                                <td>
                                    <%-- input - email from user + validation --%>
                                    <asp:Label ID="lbl_appEmail" runat="server" Text="Email*:      " />
                                    <asp:TextBox ID="txt_appEmail" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_appEmail" ValidationGroup="apply" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                                <td>
                                    <%-- input - cover letter from user + validation --%>
                                    <asp:Label ID="lbl_appMsg" runat="server" Text="Cover Letter*:      " />
                                    <asp:TextBox ID="txt_appMsg" runat="server" Rows="10" Columns="50" TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator ID="rfv_msg" runat="server" Text="*Required" ControlToValidate="txt_appMsg" ValidationGroup="apply" />
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                                <td>
                                    <%-- upload - resume from user + validation --%>
                                    <asp:Label ID="lbl_upload" runat="server" Text="Upload your resume*:      " />
                                    <asp:FileUpload ID="fileupload1" runat="server" />
                                    <%--<asp:RequiredFieldValidator ID="rfv_file" runat="server" Text="*Required" ControlToValidate="fileupload1" ValidationGroup="apply" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fileupload1" ErrorMessage="Please select a .pdf or .doc file" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F))|((d|D)(o|O)(c|C))|((d|D)(o|O)(c|C)(x|X)))$"></asp:RegularExpressionValidator>--%>
                                </td>
                            </tr>

                            <tr><td><br /></td></tr>

                            <tr>
                                <td colspan="3">
                                    <%-- lbl to thanks user --%>
                                    <asp:Label ID="lblthanks" runat="server" />
                                    <br />
                                    <%-- apply and cancel buttons --%>
                                    <asp:Button ID="btn_apply" runat="server" Text="Apply" CommandName="Apply" ValidationGroup="apply" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel"  />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>


</asp:Content>

