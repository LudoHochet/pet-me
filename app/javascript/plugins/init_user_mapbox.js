import mapboxgl from 'mapbox-gl';

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker.lng, marker.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


const addUserMarkerToMap = (map, marker) => {
  const userMap = document.getElementById('user-map');
  if (userMap) {
  const marker = JSON.parse(userMap.dataset.markers);

    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

  }
};

const initUserMapBox = () => {
  const userMap = document.getElementById('user-map');
  const marker = JSON.parse(userMap.dataset.markers);
  if (userMap) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = userMap.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'user-map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    addUserMarkerToMap(map, marker);
    fitMapToMarker(map, marker);
  }
};

export { initUserMapBox };

