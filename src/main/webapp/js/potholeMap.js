var map;
var directionsDisplay;
var directionsService;

var columbusCenterPos = {lat: 39.9612, lng: -82.9988};

function initMap2() {
    directionsService = new google.maps.DirectionService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map(document.getElementById('map'), {
        center: columbusCenterPos,
        zoom: 14
    });
    directionsDisplay.setMap(map);

    var infoWindow = new google.maps.InfoWindow({
        content: 'Something from the database'
    });

    marker.addListener('click', function () {
        infoWindow.open(map, marker);
    });
}


    map.addListener('click', function (event) {
        placeMarker(event.latLng, map);
    });

    function placeMarker(position, map) {
        var marker = new google.maps.Marker({
            position: position,
            map: map
        });
        map.panTo(position);
    }



