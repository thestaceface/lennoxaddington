<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="direction.aspx.cs" Inherits="Default4" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
    
    <%-- Page by Dharveen Beedah --%>

    <%-- if user is logged in as an administrator, edit button is visible. otherwise, not displayed --%>
    <asp:HyperLink ID="lnk_admin" runat="server" Text="Edit Page" NavigateUrl="~/admin/directionAdmin.aspx" CssClass="adminlink" ImageUrl="~/Images/admingear.png" />

    <%-- source http://kishor-naik-dotnet.blogspot.ca/2012/11/aspnet-google-map-v3-directions-in.html --%> 
    <%-- source http://www.sitepoint.com/working-with-geolocation-and-google-maps-api/ --%>

    <%-- Import jquery file --%>
    <script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>

    <%-- Import google API library --%>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>

    <%-- Import google api javascript file --%>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        
    <script type="text/javascript">

        // get address function to get geolocation of user
        // also check if browser support the API
        function getAddress() {
              if (navigator.geolocation) {
                  var positionOptions = {
                      enableHighAccuracy: true,
                      timeout: 10 * 1000 // 10 seconds
                  };
                  navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError, positionOptions);
              }
              else {
                  document.getElementById("error").innerHTML += "Your browser doesn't support the Geolocation API";
              }
          }

        // get address
        // if address is valid, display it in the 'from' textbox
        function writeAddressName(latLng) {
              var geocoder = new google.maps.Geocoder();
              geocoder.geocode({
                  "location": latLng
              },
              function (results, status) {
                  if (status == google.maps.GeocoderStatus.OK)
                    document.getElementById("<%=txtFrom.ClientID%>").value = results[0].formatted_address;
                  else
                      document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
              });
          }

        // get cordinate - ie. latitude and longitude of location
        function geolocationSuccess(position) {
              var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
              // Write the formatted address
              writeAddressName(userLatLng);
          }

        // call this function if there's any error occur and display in label
        function geolocationError(positionError) {
              document.getElementById('<%=error.ClientID%>').innerHTML += "Error: " + positionError.message + "<br />";
          }

        // auto complete function when user write in textbox
          $(document).ready(function () {

              var start = document.getElementById('<%=txtFrom.ClientID%>').value;
              var end = document.getElementById('<%=txtTo.ClientID%>').value;

              try {

                  var FromAutoComplete = new google.maps.places.Autocomplete(start[0], {});
                  var ToAutoComplete = new google.maps.places.Autocomplete(end[0], {});

                  google.maps.event.addListener(FromAutoComplete, 'place_changed', function () {
                      var place = FromAutoComplete.getPlace();
                  });

                  google.maps.event.addListener(ToAutoComplete, 'place_changed', function () {
                      var place = ToAutoComplete.getPlace();
                  });
              }
              catch (E) {
                  alert(E.message);
              }


          });


        // declare variables to be used in functions for map/direction and distance
          var DirectionsDisplay;
          var DirectionsService = new google.maps.DirectionsService();

        // initialize google map, display on screen
          function InitializeGoogleMap() {

              try {
                  DirectionsDisplay = new google.maps.DirectionsRenderer();
                  var LatitudeLongitude = new google.maps.LatLng(44.24031, -76.96587);
                  var GoogleMapOptions =
                  {
                      zoom: 10,
                      center: LatitudeLongitude,
                      mapTypeId: google.maps.MapTypeId.ROADMAP
                  };
                  var map = new google.maps.Map($("#DivGoogleMapCanvas")[0], GoogleMapOptions);

                  DirectionsDisplay.setMap(map);
                  DirectionsDisplay.setPanel($("#DivDirectionRouteStatus")[0]);
              }
              catch (E) {
                  alert(E.message);
              }

          }

        // get direction from the input location to the hospital or any destination
        // client side validation also
          function GetDirectionRoute() {

              var start = document.getElementById('<%=txtFrom.ClientID%>').value;
              var end = document.getElementById('<%=txtTo.ClientID%>').value;

              try {
                  if (start.length != 0 && end.length != 0) {

                      var From = start;
                      var To = end;
                      var Request = {
                          origin: From,
                          destination: To,
                          travelMode: google.maps.DirectionsTravelMode.DRIVING
                      };
                      DirectionsService.route(Request, function (response, status) {
                          if (status == google.maps.DirectionsStatus.OK) {
                              DirectionsDisplay.setDirections(response);
                          }
                      });
                  }
                  else {
                      if (start.length == 0) {
                          alert("Enter From Location");
                      }
                      else if (end.length == 0) {
                          alert("Enter To Location");
                      }
                  }
              }
              catch (E) {
                  alert(E.message);
              }

          }

        // initialize google map when page load
        window.onload = InitializeGoogleMap;

    </script>

    <div>
        <h1>Maps and Directions</h1>
        <%-- to and from textboxes --%>

        <table class="tables">
            <tr>
                <td>
                    From: 
                </td>
                <td>
                    <asp:TextBox ID="txtFrom" runat="server" ></asp:TextBox>
                </td> 
                <td>
                    <%-- get location button --%>
                    <asp:ImageButton ID="btnGetAddress" runat="server" Width="30px" Height="30px" ImageUrl="~/Images/location.png" OnClientClick="getAddress(); return false" />
                </td>
            </tr>
            <tr>
                <td>
                    To: 
                </td>
                <td>
                    <asp:TextBox ID="txtTo" runat="server"  Text="8 Richmond Park Drive, Napanee, ON K7R 2Z4"></asp:TextBox>
                </td> 
            </tr>
        </table>

        <%-- error message label --%>
        <asp:Label ID="error" runat="server" /><br />
        
        <%-- 3 buttons - get direction, get distance and reset --%>
        <asp:Button ID="btnDirections" runat="server" Text="Get Direction" OnClientClick="GetDirectionRoute(); return false" />
        <asp:Button ID="btnGetDistance" runat="server" Text="Get Distance" OnClick="subGetDistance" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="subReset" />

        <br /><br />
              
        <%-- google map --%>
        <div id ="DivGoogleMapCanvas" style="height:480px"></div>

        <br /><br />

        <%-- get distance panel --%>
        <asp:Panel ID="pnl_distance" runat="server">
            <div id ="DivDirectionRouteStatus" style="height:480px;overflow: auto">Distance</div>
            <br /><br />
        </asp:Panel>
    </div>

    <%-- panel displaying hospital address, phone number and visiting hours --%>
    <asp:Panel ID="pnl_all" runat="server" GroupingText="Hospital Details">
            <table style="width:100%; padding-left:30px; padding-right:30px;">
                <tbody>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("name") %></td>
                                <td style="text-align:right;">VISITING HOURS</td>
                            </tr>
                            <tr>
                                <td><%#Eval("street") %>, </td>
                                <td style="text-align:right;"><%#Eval("hours") %></td>
                            </tr>
                            <tr>
                                <td><%#Eval("city") %>, <%#Eval("postalCode") %></td>
                            </tr>
                            <tr>
                                <td><%#Eval("province") %></td>
                            </tr>
                            <tr>
                                <td><%#Eval("tel") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

</asp:Content>

