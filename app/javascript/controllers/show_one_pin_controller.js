import { Controller } from "stimulus"

import { map_default_setting , map_btn_setting , map_make_one_pin_no_content ,map_delete_pins , map_set_address ,map_set_latlon } from "../commons/map"

// 📍保存用の枠
var pin_box = [];

export default class extends Controller {
  static targets = ["map","lat","lon"]

  connect(e) {
    this.map = new Y.Map(this.mapTarget.id,{configure : {
                scrollWheelZoom : true
              }});

    // 地図の初期設定を行う
    map_default_setting(this.map,this.latTarget,this.lonTarget);

    //表示しているピンを消す(念の為、リロード時用？)
    map_delete_pins(this.map,pin_box)

    // ピンを建てる
    map_make_one_pin_no_content(this.map,this.latTarget,this.lonTarget,pin_box)
  }
}
