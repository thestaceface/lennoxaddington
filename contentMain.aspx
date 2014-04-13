<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="contentMain.aspx.cs" Inherits="contentMain" Theme="WLTheme" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Repeater ID="rpt_one" runat="server" >
        <ItemTemplate>
            <br />
        <%--<h2><asp:Label ID="lbl_header" runat="server" Text='<%# Eval("cp_pagename") %>' /></h2>--%>
            <br />

        <asp:Label ID="lbl_content" runat="server" Text='<%# Eval("cp_content") %>' />

        <asp:Label ID="lbl_lastup" runat="server" Text='<%# Eval("cp_lastupdate") %>' />
        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
<%--    <asp:Repeater ID="rpt_list" runat="server" OnItemDataBound="subSelect">
        <HeaderTemplate>
            <table class="gridtable">
            <tr>
                <th>list of pages (for my testing)... until i figure out the menu</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:LinkButton id="lkb_title" runat="server" Text='<%#Eval("cp_pagename") %>'></asp:LinkButton></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>--%>
</asp:Content>


