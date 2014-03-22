<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.master" AutoEventWireup="true" CodeFile="directionAdmin.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>
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

    <asp:Label ID="lbl_message" runat="server" />
        <br /><br />

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

                            <tr style="text-align:center;">
                                <td><asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("id") %>' OnCommand="subAdmin" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Hospital Details">
            <table>
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("id") %>' />
                                <td>
                                    <asp:Label ID="lbl_nameU" runat="server" Text="Name" /><br />
                                    <asp:TextBox ID="txt_nameU" runat="server" Text='<%#Eval("name") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_nameU" runat="server" Text="*Required" ControlToValidate="txt_nameU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_streetU" runat="server" Text="Street" /><br />
                                    <asp:TextBox ID="txt_streetU" runat="server" Text='<%#Eval("street") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_streetU" runat="server" Text="*Required" ControlToValidate="txt_streetU" ValidationGroup="update" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="lbl_cityU" runat="server" Text="City" /><br />
                                    <asp:TextBox ID="txt_cityU" runat="server" Text='<%#Eval("city") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_cityU" runat="server" Text="*Required" ControlToValidate="txt_cityU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_provinceU" runat="server" Text="Province" /><br />
                                    <asp:TextBox ID="txt_provinceU" runat="server" Text='<%#Eval("province") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_dateU" runat="server" Text="*Required" ControlToValidate="txt_provinceU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_postalCodeU" runat="server" Text="Postal Code" /><br />
                                    <asp:TextBox ID="txt_postalCodeU" runat="server" Text='<%#Eval("postalCode") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_postalCodeU" runat="server" Text="*Required" ControlToValidate="txt_postalCodeU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_telU" runat="server" Text="Telephone" /><br />
                                    <asp:TextBox ID="txt_telU" runat="server" Text='<%#Eval("tel") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_telU" runat="server" Text="*Required" ControlToValidate="txt_telU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_hoursU" runat="server" Text="Working Hours" /><br />
                                    <asp:TextBox ID="txt_hoursU" runat="server" Text='<%#Eval("hours") %>' />
                                    <asp:RequiredFieldValidator ID="rfv_hoursU" runat="server" Text="*Required" ControlToValidate="txt_hoursU" ValidationGroup="update" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" ValidationGroup="update" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>

</asp:Content>

