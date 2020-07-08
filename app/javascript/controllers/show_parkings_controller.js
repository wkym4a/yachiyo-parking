import { Controller } from "stimulus"

import { decided_flg,map_default_setting , map_btn_setting , map_make_one_pin_no_content ,map_delete_pins , map_set_address ,map_set_latlon ,map_make_user_pin,map_make_parking_pin} from "../commons/map"

// 📍保存用の枠
var user_pin_box = [];
var parking_pin_box = [];

export default class extends Controller {
  static targets = ["map","lat","lon","name","address","tel","fax","url","memo","parkings_symbol","parkings_lat","parkings_lon","parkings_name","parkings_status","parkings_number","parkings_empty_number","parkings_address","parkings_price","parkings_memo"]

    connect(e) {

      //add for mapbox
      mapboxgl.accessToken = 'pk.eyJ1Ijoid2t5bTRhIiwiYSI6ImNrOTc0YnZpZzEwOXkzZW8xZjhrc3VxMTgifQ.FSjecqZ_pzwIEgPzBfsuoQ';


      this.map = new mapboxgl.Map({
        container: this.mapTarget.id ,
        style: 'mapbox://styles/mapbox/streets-v11',
        /* 地図の初期緯度経度[lng,lat] */
        center: [Number(this.lonTarget.value), Number(this.latTarget.value)],
        /* 地図の初期ズームレベル */
        zoom: 17
      });
      // this.map = new Y.Map(this.mapTarget.id,{configure : {
      //             scrollWheelZoom : true
      //           }});

      // 地図の初期設定を行う
      map_default_setting(this.map,this.latTarget,this.lonTarget);

      //表示しているピンを消す(念の為、リロード時用)
      map_delete_pins(this.map,user_pin_box)

      // ピンを建てる
      var user_info = {};
      user_info.lat = this.latTarget
      user_info.lon = this.lonTarget
      user_info.name = this.nameTarget
      user_info.address = this.addressTarget
      user_info.tel = this.telTarget
      user_info.fax = this.faxTarget
      user_info.url = this.urlTarget
      user_info.memo = this.memoTarget
      map_make_user_pin(this.map,user_info,user_pin_box)

      // 駐車場について

      //表示しているピンを消す(念の為、リロード時用)
      map_delete_pins(this.map,parking_pin_box)

      if(this.parkings_symbolTargets.length > 0){
      for (var i = 0; i < this.parkings_symbolTargets.length; i++) {

        // ピンを建てる
        var parking_info = {};
        parking_info.lat = this.parkings_latTargets[i]
        parking_info.lon = this.parkings_lonTargets[i]
        parking_info.symbol = this.parkings_symbolTargets[i]
        parking_info.name = this.parkings_nameTargets[i]
        parking_info.address = this.parkings_addressTargets[i]
        parking_info.status = this.parkings_statusTargets[i]
        parking_info.number = this.parkings_numberTargets[i]
        parking_info.empty_number = this.parkings_empty_numberTargets[i]
        parking_info.price = this.parkings_priceTargets[i]
        parking_info.memo = this.parkings_memoTargets[i]

        map_make_parking_pin(this.map,parking_info,parking_pin_box)
        // map_make_parking_pin(this.map,this.parkings_latTargets[i],this.parkings_lonTargets[i],parking_pin_box,this.parkings_symbolTargets[i],this.parkings_nameTargets[i],this.parkings_addressTargets[i],this.parkings_statusTargets[i],this.parkings_numberTargets[i],this.parkings_empty_numberTargets[i],this.parkings_priceTargets[i],this.parkings_memoTargets[i])

        }
      }


    }
  }
