<%@ Page Title="Contact" Language="C#" MasterPageFile="~/WebApp.Master" AutoEventWireup="true" CodeBehind="WAContact.aspx.cs" Inherits="NZWorldMarket.WAContact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="meContainer" >

        <h2><%: Title %>.</h2>
        <%--<h3>Your contact page.</h3>--%>
        <address>
            Auckland, New Zealand<br />
            <abbr title="Phone">P:</abbr>
            +64 210 885 1474
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">joca006@ess.ais.ac.nz</a><br />
        </address>

        <div id="googleMap" style="width:100%;height:400px;"></div>

        <%--<div id="map_canvas" style="width: 100%; height: 728px; margin-bottom: 2px;"></div>--%>

        
    <%--<asp:UpdatePanel ID="pnlTest" runat="server" style="height:400px;" >
        <ContentTemplate>
            <div style="height: 60%;" id="map"></div>

            <asp:TextBox ID="txtLat" runat="server" />
            <asp:TextBox ID="txtLong" runat="server" />
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>--%>

    </div>

    <script>

        //function initialize() {  
        //    if (GBrowserIsCompatible()) {  
        //        var map = new  GMap2(document.getElementById('map_canvas'));      
        //        map.setCenter(new GLatLng(51.5,-0.1167), 2);       
        //        map.addOverlay(new  Marker(new GLatLng(43.6667,-79.4168)));      
        //        map.setUIToDefault();     
        //    }
        //}

        //var map;
        //function initialize() {
        //    map = new google.maps.Map(document.getElementById('map'), {
        //        center: new google.maps.LatLng(48.1293954, 11.556663), // Munich Germany
        //        zoom: 10
        //    });
        //}

        //function newLocation(newLat, newLng) {
        //    map.setCenter({
        //        lat: newLat,
        //        lng: newLng
        //    });
        //}

        //google.maps.event.addDomListener(window, 'load', initialize);

        function myMap() {
            var mapProp= {
                center:new google.maps.LatLng(51.508742,-0.120850),
                zoom:5,
            };
            var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
        }


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW8CKFmJ8bl6LvzoixRkDPtcVly7Qz--k&callback=myMap"></script>
</asp:Content>
