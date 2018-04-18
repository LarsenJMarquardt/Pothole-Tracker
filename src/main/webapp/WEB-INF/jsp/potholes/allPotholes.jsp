<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<div id="allPotholeList">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1>Pothole List</h1>
            </div>
        </div>
    </div>

    <div id="map"></div>
	<div id="mapPothole">
		<table>
			<tr><td>Street name:</td> <td><input type='text' id='address'/> </td> </tr>
			<tr><td></td><td><input type='button' value='Save' id='save' onclick='savePothole()'/> </td> </tr>
		</table>
	</div>

	<div id="message">Pothole location saved!</div>

    <c:url var="orderBySeverityLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="severity"/>
    </c:url>
    <c:url var="orderByStreetNameLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="street_name"/>
    </c:url>
    <c:url var="orderByReportDateLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="report_date"/>
    </c:url>
    <c:url var="orderByStatusCodeLink" value="/potholes/allPotholes">
        <c:param name="orderBy" value="status_code"/>
    </c:url>

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                Order by
                <a href="${orderBySeverityLink}">Severity</a> | <a href="${orderByStreetNameLink}">Street Name</a> | <a
                    href="${orderByReportDateLink}">Report Date</a> | <a href="${orderByStatusCodeLink}">Status Code</a>
            </div>
        </div>
    </div>
    
    <div class="allPotholes hidden-xs hidden-sm">
    		<div class="container">
    			<section id="pothole">
    				<div class="row">
    					<div class="col-md-2">
    						<b>Street Name</b>
    					</div>
    					<div class="col-md-10">
    						<div class="row">
	                        	<div class="col-md-2">
	                        		Reported
	                        	</div>
	                        	<div class="col-md-2">
	                        		
	                        	</div>
	                        	<div class="col-md-2">
	                        		Status Code
	                        	</div>
	                        	<div class="col-md-2">
	                        		Status Date
	                        	</div>
	                        	<div class="col-md-2">
	                        		Severity
	                        	</div>
	                     </div>
    					</div>
    				</div>
    			</section>
    		</div>
    </div>
    
    
    <div class="allPotholes">
        <c:forEach items="${allPotholes}" var="pothole">
            <div class="container">
                <section id="pothole" class="hidden-xs hidden-sm">
                    <div class="row">
                    		<div class="col-md-2">
	                        		<p style="font-size: 15px"><b><c:out value="${pothole.streetName}"/></b></p>
	                     </div>
	                        
	                     <div class="col-md-10">
	                        <div class="row">
	                        		<div class="col-md-2">
	                                <%--<c:out value="${pothole.id}"/>--%>
	                            		<p><c:out value="${pothole.reportDate}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                           
		                        </div>
		                        <div class="col-md-2">
		                        		<p><c:out value="${pothole.statusCode}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            <p><c:out value="${pothole.statusDate}"/></p>
		                        </div>
		                        <div class="col-md-2" style="display:flex;justify-content: center">
		                            <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png" />
                            			<img class="severity-img" src="${severityImgLink}" alt="Severity"></p>
		                        </div>
                        		</div>
                        </div>
                    </div>
                    <hr>
                  </section>
                  
                  <section id="pothole" class="hidden-md hidden-s hidden-lg">
                  	<div class="row">
                    		<div class="col-md-2">
	                        		<p style="font-size: 20px"><b><c:out value="${pothole.streetName}"/></b></p>
	                     </div>
	                        
	                     <div class="col-md-10">
	                        <div class="row">
	                        		<div class="col-md-2">
	                                <%--<c:out value="${pothole.id}"/>--%>
	                            		<p><b>Reported: </b><c:out value="${pothole.reportDate}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            
		                        </div>
		                        <div class="col-md-2">
		                        		<p> <b>Status Code: </b><c:out value="${pothole.statusCode}"/></p>
		                        </div>
		                        <div class="col-md-2">
		                            <p><b>Status Date: </b> <c:out value="${pothole.statusDate}"/></p>
		                        </div>
		                        <div class="col-md-2" style="display:flex;justify-content: center">
		                            <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png" />
                            			<img class="severity-img" src="${severityImgLink}" alt="Severity"></p>
		                        </div>
                        		</div>
                        </div>
                    </div>
                    <hr>
                  </section>
                   
            </div>

        </c:forEach>
    </div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhZ4dsKOQPtb3_-VdaqZ9dfYtrjhHC0-I&callback=initMap"
		async defer type="text/javascript"></script>

<script>
    var map;
    var marker;
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
            streetViewControl: false
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

            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.open(map, marker);
			});
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

            var marker = new google.maps.Marker({
				position: {lat: lat, lng: lng},
				map: map,
				address: address
			});

		}

	}
    
       /* var icons = {
       initialReport: { icon: 'map_0.png'}, severityLevel1: { icon: 'map_1.png'},
       severityLevel2: { icon: 'map_2.png'}, severityLevel3: {icon: 'map_3.png'},
       severityLevel4: {icon: 'map_4.png'}, severityLevel5: {icon: 'map_5.png'} };
       Function to display pothole information on the map */


       
 

</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>