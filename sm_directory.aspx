<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="sm_directory.aspx.cs" Inherits="sm_directory" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/sm_directoryADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- initializing AJAX Toolkie --%>
    <ajax:ToolkitScriptManager ID="tsm_main" runat="server" />
    <br /><br />

    <asp:Label ID="lbl_page" runat="server" Text="Select an office below to view its contact details." CssClass="lblpage" />
    <br /><br />

    <%-- AJAX accordion containing contact records --%>
<%--    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1" CssClass="acc">
        <HeaderTemplate>
            <asp:HyperLink ID="lnk_head" runat="server" NavigateUrl="#" Text='<%#Eval ("of_title") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="dir">
                <asp:Label ID="type" runat="server" Text='<%#Eval ("of_contacttype") %>' Font-Bold="true" ForeColor="#6aabbf" /> 
                    <asp:Label ID="contact" runat="server" Text='<%#Eval ("of_contact") %>' /><br />
                <asp:Label ID="lbltel" runat="server" Text="Telephone" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="tel" runat="server" Text='<%#Eval ("of_tel") %>' /><br />
                <asp:Label ID="lblfax" runat="server" Text="Fax" Font-Bold="true" ForeColor="#6aabbf" /> 
                    <asp:Label ID="fax" runat="server" Text='<%#Eval ("of_fax") %>' /><br />
                <asp:Label ID="lblemail" runat="server" Text="Email" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="email" runat="server" Text='<%#Eval ("of_email") %>' /><br />
                <asp:Label ID="lblloc" runat="server" Text="Location" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="location" runat="server" Text='<%#Eval ("of_location") %>' />
            </div>
        </ContentTemplate>
    </ajax:Accordion>--%>

    <asp:Repeater ID="diracc" runat="server">
        <ItemTemplate>
            <div class="acc">
                <div class="docacchead">
                    <asp:HyperLink ID="lnk_head" runat="server" NavigateUrl="javascript:void(0);" Text='<%#Eval ("of_title") %>' />
                </div>
                <div class="dir">
                    <asp:Label ID="type" runat="server" Text='<%#Eval ("of_contacttype") %>' Font-Bold="true" ForeColor="#6aabbf" /> 
                        <asp:Label ID="contact" runat="server" Text='<%#Eval ("of_contact") %>' /><br />
                    <asp:Label ID="lbltel" runat="server" Text="Telephone" Font-Bold="true" ForeColor="#6aabbf" />
                        <asp:Label ID="tel" runat="server" Text='<%#Eval ("of_tel") %>' /><br />
                    <asp:Label ID="lblfax" runat="server" Text="Fax" Font-Bold="true" ForeColor="#6aabbf" /> 
                        <asp:Label ID="fax" runat="server" Text='<%#Eval ("of_fax") %>' /><br />
                    <asp:Label ID="lblemail" runat="server" Text="Email" Font-Bold="true" ForeColor="#6aabbf" />
                        <asp:Label ID="email" runat="server" Text='<%#Eval ("of_email") %>' /><br />
                    <asp:Label ID="lblloc" runat="server" Text="Location" Font-Bold="true" ForeColor="#6aabbf" />
                        <asp:Label ID="location" runat="server" Text='<%#Eval ("of_location") %>' />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    
    
    <script>
        $(function () {
            $('.dir').hide();
            $('.docacchead').on('click', function () {
                $('+ div', this).slideToggle();
            });
        });
    </script>

</asp:Content>

