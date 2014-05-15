<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="ps_slideImages.aspx.cs" Inherits="ps_slideImage" %>
<%-- Page by Puneet Saini --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    <script type="text/javascript">
        alert("Welcome! Please note that this website is a Humber College student project. The LACGH website can be found at http://www.lacgh.com");
    </script>


 <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
     <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/ps_SlideImagesADMIN.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <img class="homeimg" src="Images/lacgh.jpg" />
    <div class="panel">
    <h4 class="home" id="home">Welcome to Lennox & Addington County General Hospital</h4>
    <p>The Internet King? I wonder if he could provide faster nudity&hellip; &hellip;And the fluffy kitten played with that ball of string all through the night. On a lighter note, a Kwik-E-Mart clerk was brutally murdered last night. Don't kid yourself, Jimmy. If a cow ever got the chance, he'd eat you and everyone you care about!</p>
    <p>I'm normally not a praying man, but if you're up there, please save me, Superman. When will I learn? The answers to life's problems aren't at the bottom of a bottle, they're on TV! I can't go to juvie. They use guys like me as currency. Homer no function beer well without. Oh, so they have Internet on computers now! Whoa, slow down there, maestro. There's a *New* Mexico?</p>
        </div>
    <br />
    <h5 class="home">What's New at LACGH</h5>
    <ul class="bxslider">
            <li><a href="db_donation.aspx"><img src="Images/slide1.jpg" title="Help us grow - Donate to LACGH today!" /></a></li>
            <li><a href="sm_finddoc.aspx"><img src="Images/slide2.jpg" title="Meet our doctors" /></a></li>
            <li><a href="#"><img src="Images/slide3.jpg" title="Free flu shot clinic January 12-18" /></a></li>
        </ul>

    
    <script>

        $(document).ready(function () {
            $('.bxslider').bxSlider({
                mode: 'fade',
                captions: true,
                auto: true,
                autoControls: true,
                infiniteLoop: true
            });
        });

    </script>
    
    
</asp:Content>
    
    
    
    
    
    
    
    
    
    
    
    
    <%--This page uses a nivo slider on the home page to display some of the images. The database used is SlideImages table. --%>
    <%--<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
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
      <div class="slider-wrapper theme-default">         
        <div id="nivo-slider" class="nivoSlider">    
            <%--Repeater control to show the images --%> 
          <%--<asp:Repeater ID="rpt_main" runat="server">            
                   <ItemTemplate>
                   <asp:Image ID="slide_images" runat="server"  ImageUrl='<%#Eval("sl_path")%>' />   
                   </ItemTemplate>                
          </asp:Repeater>                   
        </div>            
    </div>--%>



