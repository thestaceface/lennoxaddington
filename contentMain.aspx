<%--<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="contentMain.aspx.cs" Inherits="contentMain" Theme="WLTheme" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="contentMain.aspx.cs" Inherits="contentMain" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server"><%--this page will hold the information pulled from the contentpage database table!--%>
<%--    <div id="rpt_cm">--%>
    <asp:Repeater ID="rpt_one" runat="server" >
        <ItemTemplate>
            <br />
        <%--<h2><asp:Label ID="lbl_header" runat="server" Text='<%# Eval("cp_pagename") %>' /></h2>--%>
            <br />

        <asp:Label ID="lbl_content" runat="server" Text='<%# Eval("cp_content") %>' />

        <asp:Label ID="lbl_lastup" runat="server" Text='<%# Eval("cp_lastupdate") %>' />
        </ItemTemplate>
    </asp:Repeater>
<%--    </div>--%>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">

</asp:Content>


