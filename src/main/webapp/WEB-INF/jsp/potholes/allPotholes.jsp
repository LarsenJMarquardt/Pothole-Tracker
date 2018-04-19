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

            <c:url var="potholeIdLink" value="/potholes/employeePotholeUpdate">
                <c:param name="potholeId" value="${pothole.id}"/>
            </c:url>

            <div class="container">
                <section id="pothole" class="hidden-xs hidden-sm">
                    <div class="row">
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${isEmployee == false}">
                                    <p style="font-size: 15px"><b><c:out value="${pothole.streetName}"/></b></p>
                                </c:when>
                                <c:otherwise>
                                    <p style="font-size: 15px"><a href="${potholeIdLink}"><b><c:out
                                            value="${pothole.streetName}"/></b></a></p>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-2">
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
                                    <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png"/>
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
                                    <p><b>Reported: </b><c:out value="${pothole.reportDate}"/></p>
                                </div>
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-2">
                                    <p><b>Status Code: </b><c:out value="${pothole.statusCode}"/></p>
                                </div>
                                <div class="col-md-2">
                                    <p><b>Status Date: </b> <c:out value="${pothole.statusDate}"/></p>
                                </div>
                                <div class="col-md-2" style="display:flex;justify-content: center">
                                    <p><c:url var="severityImgLink" value="/img/${pothole.severity}.png"/>
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

    function initMap() {
        var columbusCenterPos = {lat: 39.998238, lng: -83.043742};
        directionsService = new google.maps.DirectionsService();
        directionsDisplay = new google.maps.DirectionsRenderer();
        var mapOptions = {
            center: new google.maps.LatLng(columbusCenterPos),
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            streetViewControl: false,
            gestureHandling: 'greedy'
        }
        map = new google.maps.Map(document.getElementById('map'),
            mapOptions);
    }

    $(document).ready(function () {

        $.ajax({
            url: "../api/getCoordinates",
            type: "GET",
            dataType: "json",
        }).done(function (potholes) {
            populateMap(potholes);
        }).fail(function (xhr, status, error) {
            console.log(error);
        });

    });

    var object_infowindow = [];

    function populateMap(potholes) {

        for (var i = 0; i < potholes.length; i++) {
            var address = potholes[i].streetName;
            var lat = potholes[i].latitude;
            var lng = potholes[i].longitude;
            var severity = potholes[i].severity;
            var statusCode = potholes[i].statusCode;
            var statusDate = potholes[i].statusDateToString;
            var reportDate = potholes[i].reportDateToString;

            var marker = new google.maps.Marker({
                position: {lat: lat, lng: lng},
                map: map,
                address: address,
                icon: {
                    url: '../img/map_' + severity + '.png',
                    scaledSize: new google.maps.Size(20, 20)
                }
            });

            var info = '<div id="content">' +
                '<h3 id="firstHeading" class="firstHeading">' + "<img src=../img/" + severity + ".png width='30px'>"+ address + '</h3>' +
                '<h5 id="firstHeading" class="firstHeading" style="color: hsl(0, 0%, 45%);">' + '<b style="color: hsl(0, 0%, 13%);">' + 'Report Date: ' + '</b>' + reportDate + '</h5>' +
                '<h5 id="firstHeading" class="firstHeading" style="color: hsl(0, 0%, 45%);">' + '<b style="color: hsl(0, 0%, 13%);">' + 'Status Date: ' + '</b>' + statusDate + '</h5>' +
                '<h5 id="firstHeading" class="firstHeading" style="color: hsl(0, 0%, 45%);">' + '<b style="color: hsl(0, 0%, 13%);">' + 'Status Code: ' + '</b>' + statusCode + '</h5>' +
                '</div>';

            object_infowindow['infowindow' + i] = new google.maps.InfoWindow({

        		content: info,
             });
            
            var onclick = function(object_infowindow,marker){
            	      var obj = object_infowindow;
            	      return function(){
            	      obj.open(map,marker);
            	      }
            	}
            
            var onMouseOut = function(object_infowindow,marker){
      	      var obj = object_infowindow;
      	      return function(){
      	      obj.close(map,marker);
	      	      }
	      	}

            	google.maps.event.addListener(marker, 'click', onclick(object_infowindow['infowindow' + i], marker) );
            	
            	google.maps.event.addListener(marker, 'mouseout', onMouseOut(object_infowindow['infowindow' + i], marker) );

		}
	}
</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>