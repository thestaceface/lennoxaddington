<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Login ID="lgn_main" runat="server" CreateUserUrl="~/register.aspx" CreateUserText="Register" DestinationPageUrl="~/ps_slideImages.aspx" />
</asp:Content>


