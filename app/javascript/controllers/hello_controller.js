import { Controller } from "@hotwired/stimulus"

// コントローラークラスを定義する
export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
