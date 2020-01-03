import { Controller } from "stimulus"

import { decided_flg,map_default_setting , map_btn_setting , map_make_one_pin_no_content ,map_delete_pins , map_set_address ,map_set_latlon ,map_make_user_pin,map_make_parking_pin} from "../commons/map"

// 📍保存用の枠
var user_pin_box = [];
var parking_pin_box = [];

export default class extends Controller {
  static targets = ["map","lat","lon","name","address","url","parkings_symbol","parkings_lat","parkings_lon","parkings_name","parkings_address","parkings_price","parkings_memo"]

    connect(e) {

      this.map = new Y.Map(this.mapTarget.id,{configure : {
                  scrollWheelZoom : true
                }});

      // 地図の初期設定を行う
      map_default_setting(this.map,this.latTarget,this.lonTarget);

      //表示しているピンを消す(念の為、リロード時用)
      map_delete_pins(this.map,user_pin_box)

      // ピンを建てる
      map_make_user_pin(this.map,this.latTarget,this.lonTarget,user_pin_box,this.nameTarget,this.addressTarget,this.urlTarget)

      // 駐車場について

      //表示しているピンを消す(念の為、リロード時用)
      map_delete_pins(this.map,parking_pin_box)

      if(this.parkings_symbolTargets.length > 0){
      for (var i = 0; i < this.parkings_symbolTargets.length; i++) {

        // ピンを建てる
        map_make_parking_pin(this.map,this.parkings_latTargets[i],this.parkings_lonTargets[i],parking_pin_box,this.parkings_symbolTargets[i],this.parkings_nameTargets[i],this.parkings_addressTargets[i],this.parkings_priceTargets[i],this.parkings_memoTargets[i])

        }
      }


    }
  }
