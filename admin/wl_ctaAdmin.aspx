<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="wl_ctaAdmin.aspx.cs" Inherits="admin_wl_ctaAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <asp:Label ID="lbl_title" runat="server" Text="CTA administration" />
        <asp:DropDownList ID="ddl_test" runat="server" />
        <asp:Repeater ID="rpt_cta" runat="server"  >
            <HeaderTemplate>
                <table>   
                    <thead>
                        <td>Page Name</td>

                        <td>CTA1</td>
                        <td>CTA2</td>
                        
                    </thead>             
            </HeaderTemplate>

            <ItemTemplate>

                    <tr runat="server" id="row">
                        <td>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("cp_id") %>' />
                            <asp:Linkbutton ID="lkb_pagename" runat="server" Text='<%#Eval("cp_pagename") %>'  />
                        </td>
                        <td>
<%--                            <asp:DropDownList ID="ddl_cta" runat="server" AppendDataBoundItems="true"  >
                                <asp:ListItem Value="x" Text="x" ></asp:ListItem>
                            </asp:DropDownList>--%>
                            <asp:TextBox ID="txt_cta1" runat="server"  Text='<%#Bind("cp_cta1") %>' />
                            
                        </td>
                        <td>
                            <asp:TextBox ID="txt_cta2" runat="server" Text='<%#Bind("cp_cta2") %>' />
                        </td>
                    </tr>
                
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_footer" Runat="Server">
</asp:Content>

