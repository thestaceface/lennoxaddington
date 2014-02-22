<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="sm_events.aspx.cs" Inherits="sm_events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
     <asp:SqlDataSource ID="sds_events" runat="server" ConnectionString="<%$ ConnectionStrings:lennoxConnectionString %>" SelectCommand="SELECT [ev_title], [ev_date], [ev_desc], [ev_id] FROM [Events]" />

        <asp:GridView ID="grv_select" runat="server" AutoGenerateColumns="false" DataSourceID="sds_events">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="hpl_upcoming" runat="server" Text='<%# Eval("ev_title") %>' NavigateUrl="#" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>

