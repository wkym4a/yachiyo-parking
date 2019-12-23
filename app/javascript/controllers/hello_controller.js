// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

// add
import { gr2 } from "./h_test"
import { gr22 } from "../tt/test"

export default class extends Controller {
  static targets = [ "name" ]



  initialize() {
    console.log(this.name)
  }



  greet() {
    console.log(`Hello, ${this.name}!3`)
      gr22(this.nameTarget,"!!??");
  }

  get name() {
    return this.nameTarget.value
    // return this.nameTarget.value + "eeee"
  }
}

// export default class extends Controller {
//   static targets = [ "output" ]
//
//   connect() {
//     this.outputTarget.textContent = 'Hello, Stimulus!'
//   }
// }
