
// google.maps.event.addDomListener(window, 'load', initialize);
// 窗口载入后通过执行 initialize() 函数来初始化 Map 对象，这样可以确保在页面完全载入后再加载 Google 地图
var index=0;

function addMap(lon,lat)
{
var map;
var myCenter=new google.maps.LatLng(lat,lon);
// var location = document.querySelector("#googleMap").className
function initialize()
{ // set google map property
  var mapProp = {
    center:myCenter,
    zoom:10,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
// obtain map div in html
  map = new google.maps.Map(document.querySelectorAll(".googleMap")[index],mapProp);

  var marker = new google.maps.Marker({
    position: myCenter,
    map: map,
  })
  marker.setMap(map);

  
  google.maps.event.addListener(marker,'click',function() {
      map.setZoom(12);
      map.setCenter(marker.getPosition());
  });
index++;
//generate marker at clicked postion and show detail positon in content
}
google.maps.event.addDomListener(window, 'load', initialize);

}