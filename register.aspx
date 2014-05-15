<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_Default" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:CreateUserWizard ID="reg_main" runat="server" ContinueDestinationPageUrl="~/login.aspx" />
</asp:Content>

