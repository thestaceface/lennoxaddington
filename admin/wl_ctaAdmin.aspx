﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="wl_ctaAdmin.aspx.cs" Inherits="admin_wl_ctaAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <h2>CTA administration</h2>
        <asp:Label ID="lbl_success" runat="server" /><br />

    <asp:Hyperlink runat="server" ID="hpl_toAdmin" Text="Go Back To Admin Main" NavigateUrl="~/admin/wl_crudMain.aspx"    />
    <br /><br />
    <asp:Repeater ID="rpt_cta" runat="server" OnItemCommand="subCommand" > <%--very standard fare repeater display--%>
        <HeaderTemplate>
            <table>   
                <thead>
                    <td><h3>Page Name</h3></td>
                    <td></td>
                    <td><h3>CTA1</h3></td>
                    <td><h3>CTA2</h3></td>
                    <td></td>
                        
                </thead>             
        </HeaderTemplate>

        <ItemTemplate>
            <tr runat="server" id="row">
                <td>
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("cp_id") %>' />
                    <%--<asp:Label ID="lbl_id" runat="server" Text='<%#Eval("cp_id") %>' />--%>
                    <asp:Label ID="lbl_pagename" runat="server" Text='<%#Eval("cp_pagename") %>'  /><br />
                    <asp:RangeValidator ID="rv_txtCta1" runat="server" Text="Value for CTA1 must be 1-4" ControlToValidate="txt_cta1" MaximumValue="4" MinimumValue="1" Display="Dynamic" ForeColor="red" /> 
                    <asp:RangeValidator ID="rv_txtCta2" runat="server" Text="<br />Value for CTA2 must be 1-4" ControlToValidate="txt_cta2" MaximumValue="4" MinimumValue="1" Display="Dynamic" ForeColor="red" />
                </td>

                <td>
                </td>
                
                <td>
                    <asp:TextBox ID="txt_cta1" runat="server" Width="40"  Text='<%#Bind("cp_cta1") %>' /><br />
                                        
                    
                                  
                </td>
               
                <td>
                    <asp:TextBox ID="txt_cta2" runat="server" Width="40" Text='<%#Bind("cp_cta2") %>' /><br />
                    
                    
                </td>
                
                <td>
                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                </td>
            </tr>
 
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server"> <%--this is where the example ctas will display--%>
   <h2>Legend</h2>
    <h3>CTA 1</h3>
    <cta:Donate ID="cta_donate" runat="server" />
    <h3>CTA 2</h3>
    <cta:Faq ID="cta_faq" runat="server" />
    <h3>CTA 3</h3>
    <cta:FluShot ID="cta_flu" runat="server" />
    <h3>CTA 4</h3>
    <cta:Newsletter ID="cta_newsletter" runat="server" /><%-- --%>
</asp:Content>


