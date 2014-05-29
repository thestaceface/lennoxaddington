<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="sm_events.aspx.cs" Inherits="sm_events" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- if user is logged in as administrator, edit button is visible. if not, button is not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/sm_eventsADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- initializing AJAX Toolkit --%>
    <ajax:ToolkitScriptManager ID="scm_events" runat="server" />
    <br /><br />

    <asp:Label ID="lbl_page" runat="server" Text="Select an event below to view more details." CssClass="lblpage" />
    <br /><br />
    
    <%-- accordion containing events records --%>
<%--    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1">
        <HeaderTemplate>
            <asp:Hyperlink ID="date" runat="server" NavigateUrl="#" Text='<%#Eval ("ev_date", "{0:d}") %>' /> 
            <asp:HyperLink ID="title" runat="server" NavigateUrl="#" text='<%#Eval ("ev_title") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="event">
                <asp:Image ID="img" runat="server" ImageUrl='<%#Eval ("ev_media") %>' CssClass="accimg" />
                <div class="info">
                    <asp:Label ID="body" runat="server" Text='<%#Eval ("ev_body") %>' />
                </div>
            </div>
        </ContentTemplate>
    </ajax:Accordion>--%>
    

    <asp:Repeater ID="evacc" runat="server">
        <ItemTemplate>
            <div class="acc">
                <div class="docacchead">
                    <asp:Hyperlink ID="date" runat="server" NavigateUrl="javascript:void(0);" Text='<%#Eval ("ev_date", "{0:d}") %>' /> 
                    <asp:HyperLink ID="title" runat="server" NavigateUrl="javascript:void(0);" text='<%#Eval ("ev_title") %>' />
                </div>

                <div class="event">
                    <asp:Image ID="img" runat="server" ImageUrl='<%#Eval ("ev_media") %>' CssClass="accimg" />
                        <asp:Label ID="body" runat="server" Text='<%#Eval ("ev_body") %>' />
                </div>
            </div>
            <div class="clear"></div>
        </ItemTemplate>
    </asp:Repeater>

    <script>
        $(function () {
            $('.event').hide();
            $('.docacchead').on('click', function () {
                $('+ div', this).slideToggle();
            });
        });
    </script>

</asp:Content>

