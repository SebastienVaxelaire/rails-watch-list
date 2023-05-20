import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Create lists for you and your family", "Add bookmarks to them!"],
      typeSpeed: 50,
      loop: true
    })
  }
}
