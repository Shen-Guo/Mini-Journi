// var mapProp = {
//   center:new google.maps.LatLng(51.508742,-0.120850),
//   zoom:7,
//   mapTypeId: google.maps.MapTypeId.ROADMAP
// };
function initialize()
{
    var mapProp = {
        center:new google.maps.LatLng(52.508742,-0.120850),
        zoom:1,
        mapTypeId:google.maps.MapTypeId.HYBRID
    };
    var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
}
 
google.maps.event.addDomListener(window, 'load', initialize);