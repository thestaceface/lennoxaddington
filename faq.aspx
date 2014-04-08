<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
  

<asp:PlaceHolder ID="formPH" runat="server" Visible="true">

<div>


<asp:Panel ID="pnl_new" runat="server">
   


<asp:SqlDataSource runat="server" ID="sds_main" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [faq]" />

    <asp:Repeater runat="server" ID="rpt_faq" DataSourceID="sds_main">
     
        <ItemTemplate>
             <br />
            <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("title") %>'/>
            <br />
             <asp:Label ID="lbl_content" runat="server" Text='<%#Eval("content") %>'/>
             <br />
        </ItemTemplate>
   

    </asp:Repeater>  


</asp:Panel>

</div>

</asp:PlaceHolder>
    
</asp:Content>










      
    





