﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_finddoc.aspx.cs" Inherits="sm_finddoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <ajax:ToolkitScriptManager id="tsm_main" runat="server" />
    <br />
    <br />
    <asp:Label ID="lbl_page" runat="server" Text="Below you can find information on all of LACGH's current doctors." CssClass="lblpage" />
    <br />
    <br />

    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1">
        <HeaderTemplate>
            <asp:HyperLink id="lnk_head" runat="server" NavigateUrl="#" text='<%#Eval ("doc_name") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <asp:Label ID="lbl_name" runat="server" Text='<%#Eval ("doc_name") %>' />
          
            <%--<asp:Label ID="lbl_dept" runat="server" Text="Department: " />--%>
            <%--<asp:Label ID="dept" runat="server" Text='<%#Eval ("dp_name") %>' />--%>
            
            <asp:Image ID="img" runat="server" ImageUrl='<%#Eval ("doc_img") %>' />
            <div class="info">
                <%#Eval ("doc_bio") %>
                <br />
                <asp:HyperLink ID="hpl_contact" runat="server" NavigateUrl="#" Text="Contact" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hpl_appt" runat="server" NavigateUrl="#" Text="Book an Appointment" />
            </div>

        </ContentTemplate>
    </ajax:Accordion>

</asp:Content>
