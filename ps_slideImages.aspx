<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="ps_slideImages.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Default.css" rel="stylesheet" type="text/css" />
    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Demo.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(window).load(function () {
            $('#nivo-slider').nivoSlider({
                effect: 'boxRainReverse',
                slices: 15,                     // For slice animations
                boxCols: 8,                     // For box animations
                boxRows: 4,                     // For box animations
                animSpeed: 500,                 // Slide transition speed
                pauseTime: 3000,                // How long each slide will show
                startSlide: 0,                  // Set starting Slide (0 index)
                directionNav: true,             // Next & Prev navigation
                controlNav: true,               // 1,2,3... navigation
                controlNavThumbs: false,        // Use thumbnails for Control Nav
                pauseOnHover: true,             // Stop animation while hovering
                manualAdvance: false,           // Force manual transitions
                prevText: 'Prev',               // Prev directionNav text
                nextText: 'Next',               // Next directionNav text
                randomStart: false,             // Start on a random slide
                beforeChange: function () { },     // Triggers before a slide transition
                afterChange: function () { },      // Triggers after a slide transition
                slideshowEnd: function () { },     // Triggers after all slides have been shown
                lastSlide: function () { },        // Triggers when last slide is shown
                afterLoad: function () { }
                
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
      <div class="slider-wrapper theme-default">         
        <div id="nivo-slider" class="nivoSlider">     
          <asp:Repeater ID="rpt_main" runat="server">
              
                   <ItemTemplate>
                   <asp:Image ID="slide_images" runat="server"  ImageUrl='<%#Eval("sl_path")%>' />         
                   </ItemTemplate>
                
          </asp:Repeater>
          
           
        </div>            
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_aside" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_footer" Runat="Server">
</asp:Content>

