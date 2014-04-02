<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="wl_testpage.aspx.cs" Inherits="wl_testpage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:DropDownList ID="ddl_main" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
    <cta:FluShot ID="flu" runat="server" />
    <cta:Donate ID="donate" runat="server" />
    <cta:Newsletter id="news" runat="server" />
</asp:Content>


