﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="rf_findout.aspx.cs" Inherits="rf_findout" %>
<%-- Rezwanul Ferdous 824-259-246 --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/rf_findoutADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- initializing AJAX Toolkit --%>   
    <ajax:ToolkitScriptManager ID="tsm_main" runat="server" />
    <br />
    <br />
    <asp:Label ID="lblpage" runat="server" Text="Select an item below to view details." CssClass="lblpage" />
    <br />
    <br />

    <%-- AJAX accordion to display find out more records --%>
    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1" CssClass="acc">
        <HeaderTemplate>
            <asp:HyperLink ID="lnk_head" runat="server" NavigateUrl="#" Text='<%#Eval ("el_name") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="lnk">
                <asp:Label ID="lbl_name" runat="server" Text="Link Title " Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="name" runat="server" Text='<%#Eval ("el_name") %>' /><br />
                <asp:Label ID="lbl_category" runat="server" Text="Category " Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="category" runat="server" Text='<%#Eval ("el_category") %>' /><br />
                <asp:Label ID="lbl_brief" runat="server" Text="Brief " Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="brief" runat="server" Text='<%#Eval ("el_brief") %>' /><br />
                <asp:HyperLink ID="hpl_link" runat="server" NavigateUrl='<%#Eval ("el_link") %>' Text="Click here to visit this link" />
            </div>
        </ContentTemplate>
    </ajax:Accordion>

</asp:Content>

