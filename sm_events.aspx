<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_events.aspx.cs" Inherits="sm_events" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/sm_eventsADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />
    <br />
    <br />

    <ajax:ToolkitScriptManager ID="scm_events" runat="server" />
    
    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1">
        <HeaderTemplate>
            <asp:Hyperlink ID="date" runat="server" NavigateUrl="#" Text='<%#Eval ("ev_date", "{0:d}") %>' /> 
            <asp:HyperLink ID="title" runat="server" NavigateUrl="#" text='<%#Eval ("ev_title") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="event">
                <asp:Image ID="img" runat="server" ImageUrl='<%#Eval ("ev_media") %>' />
                <asp:Label ID="body" runat="server" Text='<%#Eval ("ev_body") %>' />
            </div>
        </ContentTemplate>
    </ajax:Accordion>
    
</asp:Content>

