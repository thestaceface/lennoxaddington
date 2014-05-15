<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="wl_sitemapAdmin.aspx.cs" Inherits="admin_wl_sitemapAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_content" Runat="Server">

    <h2>SiteMap Admin</h2>
    <asp:HyperLink ID="hpl_toMain" runat="server" NavigateUrl="~/admin/wl_crudMain.aspx" Text="Return to Main Administration Page" />
    <br />
    <asp:Button ID="btn_select" runat="server" OnClick="subSelect" text="select page to move " />
    <asp:Button ID="btn_bottom" runat="server" OnClick="moveToBottom" Text="move to bottom" Enabled="false" />
    <asp:Button ID="btn_top" runat="server" OnClick="moveToTop" Text="move to top" Enabled="false" />
    <asp:Label ID="lbl_output" runat="server" />


<asp:Panel ID="firstpanel" runat="server">
    <asp:TreeView ID="TreeView1" Runat="Server" DataSourceID="SiteMapDataSource1" ShowCheckBoxes="All" SelectedNodeStyle-BackColor="green" EnableViewState="true" SelectedNodeStyle-BorderWidth="2"   >

    </asp:TreeView>

    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

    <asp:Label ID="lbl_test" runat="server" />
    <asp:BulletedList id="bl_sitemap" runat="server" BulletStyle="Numbered" />
</asp:Panel>

<%--originally thought of putting two panels up.  one for node to move.  one for location to move to.  too hard--%>
<%--<asp:Panel ID="secondpanel" runat="server">  
    <asp:TreeView ID="TreeView2" Runat="Server" DataSourceID="SiteMapDataSource2" ShowCheckBoxes="All" SelectedNodeStyle-BackColor="green" EnableViewState="true" SelectedNodeStyle-BorderWidth="2"  >
    </asp:TreeView>

    <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" />
</asp:Panel>--%>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_aside" Runat="Server">

</asp:Content>


