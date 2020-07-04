import { Controller } from "stimulus"
//mapbox移行用テスト
export default class extends Controller {
  static targets = [ "map" ]

  initialize() {//←①

    mapboxgl.accessToken = 'pk.eyJ1Ijoid2t5bTRhIiwiYSI6ImNrOTc0YnZpZzEwOXkzZW8xZjhrc3VxMTgifQ.FSjecqZ_pzwIEgPzBfsuoQ';

    var map = new mapboxgl.Map({
        container: this.mapTarget.id ,
        style: 'mapbox://styles/mapbox/streets-v11',
        /* 地図の初期緯度経度[lng,lat] */
        center: [139.72116702175174, 35.64997652994234],
        /* 地図の初期ズームレベル */
        zoom: 9
    });

    // var marker = new mapboxgl.Marker().setLngLat([139.72116702175174, 35.64997652994234]).addTo(map);

//        this.map = new Y.Map(this.mapTarget.id);//←②
//        this.map.drawMap(new Y.LatLng(35.66572, 139.73100), 17, Y.LayerSetId.NORMAL);//←③
//
// 　　　　//↓④
//        var center = new Y.CenterMarkControl
//        var control = new Y.LayerSetControl();
//        this.map.addControl(center);
//        this.map.addControl(control);

  }
}
