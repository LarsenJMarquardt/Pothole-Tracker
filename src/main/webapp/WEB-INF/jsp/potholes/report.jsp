<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id = "report">


    <c:url var="reportHref" value="/potholes/report"/>

	<div id="map"></div>
	<div id="mapPothole">
		<table>
			<tr><td>Street name:</td> <td><input type='text' id='address'/> </td> </tr>
			<tr><td></td><td><input type='button' value='Save' id='save'/> </td> </tr>
		</table>
	</div>

    <div id="message">Pothole location saved!</div>

    <form method="POST" action="${reportHref}" >
    		<div class="row">
    			<div class="col-sm-4"></div>
    			<div class="col-sm-4">
    				<div class="form-group">
    					<label for="streetName">Street Name:</label>
    					<input type="text" name="streetName" id="streetName" placeHolder="e.g. Brian St" class="form-control" />
    				</div>
    				<div class="form-group">
    					<label for="latitude">Latitude:</label>
    					<input type="text" name="latitude" id="latitude" placeHolder="Latitude" class="form-control" />
    				</div>
    				<div class="form-group">
    					<label for="longitude">Longitude:</label>
    					<input type="text" name="longitude" id="longitude" placeHolder="Longitude" class="form-control" />
    				</div>
    				<button type="submit" class="btn btn-warning">Report Pothole</button>
    			</div>
    				
    				
    				
    				<div class="col-sm-4"></div>
    			</div>
    </form>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhZ4dsKOQPtb3_-VdaqZ9dfYtrjhHC0-I&callback=initMap"
            async defer type="text/javascript"></script>
    <script>
        var map;
        var marker;
        var infoWindow;
        var messageWindow;

        function initMap() {
            var columbusCenterPos = {lat: 39.9612, lng: -82.9988};
            var mapOptions = {
                center: new google.maps.LatLng(columbusCenterPos),
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                streetViewControl: false,
                gestureHandling: 'greedy'
            }
            map = new google.maps.Map(document.getElementById('map'),
            mapOptions);

            infoWindow = new google.maps.InfoWindow({
                content: document.getElementById('mapPothole')
            });

            messageWindow = new google.maps.InfoWindow({
                content: '<p>Pothole Location Saved!</p>'
                // content: document.getElementById('message')

            });

            google.maps.event.addListener(map, 'click', function(event) {
                marker = new google.maps.Marker({
                    position: event.latLng,
                    map: map
                });
                infoWindow.open(map, marker);
        });
        }


        $(document).ready(function() {
            $.ajax({
                url: "/api/getCoordinates",
                type: "GET",
                dataType: "json",
            }).done(function(potholes) {
                populateMap(potholes);
            }).fail(function(xhr, status, error) {
                console.log(error);
            });
        });

        function populateMap(potholes) {

            for (var i = 0; i < potholes.length; i++) {
                var address = potholes[i].streetName;
                var lat = potholes[i].latitude;
                var lng = potholes[i].longitude;

                var marker = new google.maps.Marker({
                    position: {lat: lat, lng: lng},
                    map: map,
                    address: address
                });

            }
        }

        $("#save").click(function() {
            var address = (document.getElementById('address').value);
            var latLng = marker.getPosition();
            var apiUrl = "/api/setCoordinates";
            $.ajax({
                url: apiUrl,
                type: "POST",
                dataType: "json",
                data: {
                    streetName: address,
                    latitude: latLng.lat(),
                    longitude: latLng.lng()
                }
            }).done(function(number){
                infoWindow.close();
                messageWindow.open();
            }).fail(function(xhr, status, error) {
                console.log(error);
            });
        });
    </script>


</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />