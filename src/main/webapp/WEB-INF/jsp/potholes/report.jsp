<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="report">
    <div class="container-fluid">
    		<h1>Report a Pothole</h1>
		<div id="map"></div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhZ4dsKOQPtb3_-VdaqZ9dfYtrjhHC0-I&callback=initMap"
            async defer type="text/javascript"></script>
    <script>
        var map;
        var infoWindow;
        var messageWindow;

        function initMap() {
            var columbusCenterPos = {lat: 39.9612, lng: -82.9988};
            directionsService = new google.maps.DirectionsService();
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                center: new google.maps.LatLng(columbusCenterPos),
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                streetViewControl: false,
                gestureHandling: 'greedy'
            }
            map = new google.maps.Map(document.getElementById('map'),
                mapOptions);

            var infoWindowContent = '<div id="mapPothole">' +
			'<table>'+'<tr>'+'<td>'+'Street name:'+'</td>'+ '<td>'+'<input type="text" minlength="4" id="address"/>' +'</td>'+'</tr>'+
			'<tr>'+'<td>'+'</td>'+'<td>'+'<input type="button" value="Report" id="save"/>'+'</td>'+'</tr>' +
			'</table>'+
			'</div>';
            
			var messageWindowContent = '<div id="message">'+'Pothole location saved!'+'</div>';
            
            infoWindow = new google.maps.InfoWindow({
                content: infoWindowContent,
            });

            messageWindow = new google.maps.InfoWindow({
                content: messageWindowContent,
            });

            google.maps.event.addListener(map, 'click', function(event) {
                var marker = new google.maps.Marker({
                    position: event.latLng,
                    map: map,
                    icon: {
                        url: '../img/map_0.png',
                        scaledSize: new google.maps.Size(40, 40)
                    }
                });
                infoWindow.open(map, marker);
                saveToDataBase(marker);
        });
            
        
        }


        $(document).ready(function() {
            $.ajax({
                url: "/capstone/api/getCoordinates",
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
                severity = potholes[i].severity;

                var marker = new google.maps.Marker({
                    position: {lat: lat, lng: lng},
                    map: map,
                    address: address,
                    icon: {
                        url: '../img/map_' + severity + '.png',
                        scaledSize: new google.maps.Size(40, 40)
                    }
                });

            }
        }
		function saveToDataBase(marker) {
	        $("#save").click(function() {
	            var address = (document.getElementById('address').value);
	            var latLng = marker.getPosition();
	            var apiUrl = "/capstone/api/setCoordinates";
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
	                messageWindow.open(map, marker);
	            }).fail(function(xhr, status, error) {
	                console.log(error);
	            });
	        });
		}
    </script>


	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />