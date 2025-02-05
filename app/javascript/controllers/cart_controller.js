import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["optionInput", "hiddenInput", "form"];

  connect() {
  }

  selectOption(event) {
    const selectedValue = event.currentTarget.getAttribute("data-value");
    if (selectedValue) {
      console.log(selectedValue)
      this.hiddenInputTarget.value = selectedValue; 
      console.log(this.hiddenInputTarget.value) // Set the hidden input value
    }
  }

  submitForm(event) {
    const optionsExist = this.element.querySelectorAll("label").length > 0;
    console.log(optionsExist)
    if (optionsExist && this.hiddenInputTarget.value === "") {
      event.preventDefault(); 
      alert("Please select an option before adding to cart.");
    }
  }
}
