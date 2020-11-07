import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'main' ];

  append() {
    console.log('hi dummie');
    console.log(this.mainTarget)
  //   this.mainTarget.insertAdjacentHTML('afterend', <%= render "plants/index", plants: @plants %>);
  // }
}}
