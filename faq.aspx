<%@ Page Language="C#"  MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">



<asp:Repeater id="rptFAQs" runat="server">
    
 <ItemTemplate>

<asp:Label ID="lbl_faq" runat="server" Text="FAQ" />

     <div id='h<%# DataBinder.Eval(Container, "ItemIndex") %>' class="header"
          onclick='ToggleDisplay(<%# DataBinder.Eval(Container, "ItemIndex") %>);'>
       <%# DataBinder.Eval(Container.DataItem, "Description") %>
     </div>
         
     <div id='d<%# DataBinder.Eval(Container, "ItemIndex") %>' class="details">
       <b>Submitted By:</b> <%# DataBinder.Eval(Container.DataItem, "SubmittedByName") %><br />
       <b>Views:</b> <%# DataBinder.Eval(Container.DataItem, "ViewCount", "{0:d}") %><br />
       <b>FAQ:</b><br />
       <%# DataBinder.Eval(Container.DataItem, "Answer") %>
     </div>
   </ItemTemplate>
</asp:Repeater>


</asp:Content>
