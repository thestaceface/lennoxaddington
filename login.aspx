<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Login ID="lgn_main" runat="server" CreateUserUrl="~/register.aspx" CreateUserText="Register" DestinationPageUrl="~/home.aspx" />
</asp:Content>


