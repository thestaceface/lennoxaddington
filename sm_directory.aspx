<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_directory.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <ajax:ToolkitScriptManager ID="tsm_main" runat="server" />

    <br />
    <br />
    <asp:Label ID="lblpage" runat="server" Text="Select an office or department below to view its contact details." CssClass="lblpage" />
    <br />
    <br />

    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1" CssClass="acc">
        <HeaderTemplate>
            <asp:HyperLink ID="lnk_head" runat="server" NavigateUrl="#" Text='<%#Eval ("of_title") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="dir">
                <asp:Label ID="type" runat="server" Text='<%#Eval ("of_contacttype") %>' Font-Bold="true" ForeColor="#6aabbf" /> 
                    <asp:Label ID="contact" runat="server" Text='<%#Eval ("of_contact") %>' /><br />
                <asp:Label ID="lbltel" runat="server" Text="Telephone" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="tel" runat="server" Text='<%#Eval ("of_tel") %>' /><br />
                <asp:Label ID="lblfax" runat="server" Text="Fax" Font-Bold="true" ForeColor="#6aabbf" /> 
                    <asp:Label ID="fax" runat="server" Text='<%#Eval ("of_fax") %>' /><br />
                <asp:Label ID="lblemail" runat="server" Text="Email" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="email" runat="server" Text='<%#Eval ("of_email") %>' /><br />
                <asp:Label ID="lblloc" runat="server" Text="Location" Font-Bold="true" ForeColor="#6aabbf" />
                    <asp:Label ID="location" runat="server" Text='<%#Eval ("of_location") %>' />
            </div>
        </ContentTemplate>
    </ajax:Accordion>

</asp:Content>

