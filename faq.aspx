<%@ Page Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
     <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/faqADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />
    <br />
    <br />

    <ajax:ToolkitScriptManager id="tsm_main" runat="server" />
    <br /><br />
    <ajax:Accordion ID="acc" runat="server" FadeTransitions="true" TransitionDuration="500" RequireOpenedPane="false" HeaderCssClass="docacchead" ContentCssClass="docacccon" SelectedIndex="-1">
        <HeaderTemplate>
            <asp:HyperLink id="lnk_head" runat="server" NavigateUrl="#" text='<%#Eval ("fa_question") %>' />
        </HeaderTemplate>
        <ContentTemplate>
            <div class="docbio">
            <div class="info">
                    <%#Eval ("fa_answer") %>
                    <br />
            </div>
            </div>

        </ContentTemplate>
    </ajax:Accordion>

</asp:Content>

































<%--<asp:Content ID="Content1" ContentPlaceHolderID="cph_content2" Runat="Server">


<asp:PlaceHolder ID="formPH" runat="server" Visible="true">

<div>



<asp:Panel ID="pnl_new" runat="server" >
 
<table>
<tr>
    <td><asp:Label ID="lbl_new" runat="server" Text="FAQ" /></td>

</tr>


    <tr>
     
           <td> <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("fa_question") %>'/></td>
       </tr>  
        <tr>    <td>  <asp:Label ID="lbl_content" runat="server" Text='<%#Eval("fa_answer") %>'/></td></tr>  
             
    
   

   



</table>
</asp:Panel>



</div>



</asp:PlaceHolder>




</asp:Content>--%>















