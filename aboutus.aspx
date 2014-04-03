<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="aboutus.aspx.cs" Inherits="Default2" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <%-- this page describes the project --%>
    <asp:Label ID="lbl_title" runat="server" Text="About the Project" CssClass="admintitle" />
    <br />
    <br />
<p>This is a student project for Humber College’s School of Media Studies and Information Technology’s 2014 Web Development program.</p><br />
    <br />
<p>The project team consists of:<br /> 
Nadia Bernard, Content Manager<br />
Puneet Saini, Interface Designer<br />
Rezwanul Ferdous, Database Manager<br />
Stacey Masson, Team Lead and Interface Designer<br />
William Lin, Co-Team Lead and Content Manager<br />
Yash Beedah, Backend Manager</p>
    <br />
<p>All designs, code, and original content are property of Humber College and N. Bernard/P. Saini/R. Ferdous/S. Masson/W. Lin/Y. Beedah.</p><br />
    <br />
<p>The operational Lennox Addington County General Hospital website can be found here:
    <br />
<asp:HyperLink id="lnk_site" runat="server" Text="http://lacgh.com/" NavigateUrl="http://lacgh.com/" Target="_blank" /></p>

</asp:Content>
