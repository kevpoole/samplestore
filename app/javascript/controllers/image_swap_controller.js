import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mainImage", "thumbnail"];

  connect() {
  }
  replaceMainImage(e) {
    const clickedImage = e.currentTarget;
    this.mainImageTarget.src = clickedImage.src;
  }
  
}
