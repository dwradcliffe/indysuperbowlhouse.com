/* Author:
    David Radcliffe
*/

$(function(){
	$('#slides').slides({
		preload: true,
		preloadImage: 'images/loading.gif',
		play: 5000,
		pause: 2500,
		hoverPause: true
	});
});

var map;
function initialize() {
  var myOptions = {
    zoom: 11,
    center: new google.maps.LatLng(39.72758197531012,-86.1743356191406),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map'), myOptions);
  var zip = new google.maps.Marker({
    position: new google.maps.LatLng(39.665309,-86.181475), 
    map: map, 
    title: "Superbowl House"
  });
  var stadium = new google.maps.Marker({
    position: new google.maps.LatLng(39.760316,-86.161976), 
    map: map, 
    title: "Lucas Oil Stadium"
  });
}

google.maps.event.addDomListener(window, 'load', initialize);




