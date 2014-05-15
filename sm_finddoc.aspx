<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="sm_finddoc.aspx.cs" Inherits="sm_finddoc" %>
<%-- Page by Stacey Masson --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    
    <%-- if user is logged in as an administrator, edit page button will show. otherwise will not be visible --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/sm_finddocADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- initializing the AJAX toolkit --%>
    <ajax:ToolkitScriptManager id="tsm_main" runat="server" />
    <br /><br />

    <asp:Label ID="lbl_page" runat="server" Text="Below you can find information on all of LACGH's current doctors." CssClass="lblpage" />
    <br /><br />

    <%-- accordion containing doctor records --%>
    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1">
        <HeaderTemplate>
            <asp:HyperLink id="lnk_head" runat="server" NavigateUrl="#" text='<%#Eval ("doc_name") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="docbio">
                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval ("doc_name") %>' />            
                <asp:Image ID="img" runat="server" ImageUrl='<%#Eval ("doc_img") %>' />
                <div class="info">
                    <%#Eval ("doc_bio") %>
                    <br />
                    <asp:HyperLink ID="hpl_contact" runat="server" NavigateUrl="~/sm_directory.aspx" Text="Contact" CssClass="doclinks" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hpl_appt" runat="server" NavigateUrl="~/ps_appointment.aspx" Text="Book an Appointment" CssClass="doclinks" />
            </div>
            </div>

        </ContentTemplate>
    </ajax:Accordion>

</asp:Content>

