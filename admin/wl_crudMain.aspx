<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="wl_crudMain.aspx.cs" Inherits="admin_wl_crudMain" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <h2>Content Main Administration Page</h2>
    <%--maybe add instructions here--%>
    <asp:Button ID="btn_toAdd" runat="server" PostBackUrl="~/admin/wl_crudAdd.aspx" Text="Add a new page" />
    <asp:Button ID="btn_toEdit" runat="server" PostBackUrl="~/admin/wl_crudEdit.aspx" Text="Edit or Delete an existing page" />
    <asp:Button ID="btn_toCtaAdmin" runat="server" PostBackUrl="~/admin/wl_ctaAdmin.aspx" Text="Manage the CTAs" />
    <asp:Button ID="btn_toSitemapAdmin" runat="server" PostBackUrl="~/admin/wl_sitemapAdmin.aspx" Text="Change the Sitemap Order" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">

</asp:Content>


