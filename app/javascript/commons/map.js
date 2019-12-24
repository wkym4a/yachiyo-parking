
// 地図の初期設定
export function map_default_setting(map,lat,lon){

  map.drawMap(new Y.LatLng(lat.value, lon.value), 17, Y.LayerSetId.NORMAL);

  var center = new Y.CenterMarkControl
  var control = new Y.LayerSetControl();
  var sliderzoom = new Y.SliderZoomControlVertical();
  var scale = new Y.ScaleControl();
  var searchcontrol = new Y.SearchControl();
  map.addControl(center);
  map.addControl(control);
  map.addControl(sliderzoom);
  map.addControl(scale);
  map.addControl(searchcontrol);

}

// export function map_btn_setting(flg,msg,lat,lon,btn_set,btn_reset,btn_reset,btn_save){
//   msg.text=""//メッセージ枠は空欄に戻す
//
//   if(flg==false){
//
//     flg = true
//     lat.readOnly = true;
//     lon.readOnly = true;
//     btn_set[0].style.backgroundColor = '#555555';
//     btn_set[1].style.backgroundColor = '#555555';
//     btn_reset.style.backgroundColor = '#A7F1FF';
//     btn_save.disabled = false;
//
//   } else {
//
//     flg = false
//     lat.readOnly = false;
//     lon.readOnly = false;
//     btn_set[0].style.backgroundColor = '#A7F1FF';
//     btn_set[1].style.backgroundColor = '#A7F1FF';
//     btn_reset.style.backgroundColor = '#555555';
//     btn_save.disabled = true;
//
//   }
// }
