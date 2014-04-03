<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="direction.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    
    <script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>

     <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
        
      <script type="text/javascript">

          $(document).ready(function () {

              var start = document.getElementById('<%=txtFrom.ClientID%>').value;
              var end = document.getElementById('#<%=txtTo.ClientID%>').value;

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


          var DirectionsDisplay;
          var DirectionsService = new google.maps.DirectionsService();

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

          window.onload = InitializeGoogleMap;

        </script>

    <%--<asp:TextBox ID="txtFrom" runat="server" Width="400px"></asp:TextBox>

    <asp:TextBox ID="txtTo" runat="server" Width="400px" Text="8 Richmond Park Drive, Napanee, ON K7R 2Z4"></asp:TextBox>

    <asp:Button ID="btnDirections" runat="server" Text="Direction" Width="200px" OnClientClick="GetDirectionRoute(); return false" />

    <div id ="DivDirectionRouteStatus" style="height:480px;overflow: auto"></div>

    <div id ="DivGoogleMapCanvas"  style="height:480px;"></div>--%>

    <div>
        <table border="0" cellspacing="5" cellpadding="5" align="center" width="100%">
            <tr>
                <td style="width: 20%" align="center" valign="middle">From</td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtFrom" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%" align="center" valign="middle">To</td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtTo" runat="server" Width="400px" Text="8 Richmond Park Drive, Napanee, ON K7R 2Z4"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    
                </td>
                <td style="width: 80%">
                    <asp:Button ID="btnDirections" runat="server" Text="Direction" Width="200px" OnClientClick="GetDirectionRoute(); return false" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height:100%">

                    <table border="0" cellspacing="2" cellpadding="2" align="center" width="100%">
                        <tr>
                            <td style="width:40%">
                                <div id ="DivDirectionRouteStatus" style="height:480px;overflow: auto"></div>
                            </td>
                            <td style="width:60%">
                                 <div id ="DivGoogleMapCanvas"  style="height:480px;"></div>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="pnl_all" runat="server" GroupingText="Hospital Details">
            <table style="width:100%;">
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

