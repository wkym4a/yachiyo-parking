import { Controller } from "stimulus"

import { map_default_setting , map_btn_setting } from "../commons/map"

// マーカー保存用の枠
var markers = [];

// 座標が確定されているかどうが」のフラグ
var latlng_decided_flg = false;

export default class extends Controller {
  static targets = ["map","flg","lat","lon","btn_set","btn_reset","address","btn_save","msg" ]

    initialize(e) {
      this.map = new Y.Map(this.mapTarget.id,{configure : {
                  scrollWheelZoom : true
                }});

    // 地図の初期設定を行う
    map_default_setting(this.map,this.latTarget,this.lonTarget);

    // map_btn_setting();

    }

  }
