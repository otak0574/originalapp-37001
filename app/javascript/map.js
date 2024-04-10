let map, infoWindow;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 18,
  });
  
  infoWindow = new google.maps.InfoWindow();

  let agentData = document.getElementById('agent-data');
  let agentLat = parseFloat(agentData.getAttribute('data-latitude'));
  let agentLng = parseFloat(agentData.getAttribute('data-longitude'));
  let agentPos = { lat: agentLat, lng: agentLng };

  let agentMarker = new google.maps.Marker({
    position: agentPos,
    map: map,
    title: "Agent Location"
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      (position) => {
        const userPos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };

        infoWindow.setPosition(userPos);
        infoWindow.setContent("現在地");
        infoWindow.open(map);
        map.setCenter(userPos);

        // ユーザーの位置情報にもマーカーを設置
        let userMarker = new google.maps.marker.AdvancedMarkerElement({
          position: userPos,
          map: map,
          title: "Your Location"
        });
      },
      () => {
        handleLocationError(true, infoWindow, map.getCenter());
      }
    );
  } else {
    // ブラウザが Geolocation をサポートしていない場合
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
infoWindow.open(map);
}
window.initMap = initMap;

