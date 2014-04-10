<%@ Page Language="C#" %>
<%@ Import Namespace="SpiceLogic.PayPalCtrlForWPS.Infrastructure" %>
<head id="Head1" runat="server">
    <script runat="server">
    
    // Yash: do not modify this file - link to paypal
    
        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write(Z4357Access.GetContent(HttpContext.Current)); 
        }
    </script>
</head>