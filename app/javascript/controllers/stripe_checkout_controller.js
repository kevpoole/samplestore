import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

export default class extends Controller {
  static values = { url: String }

  async connect() {
    if (this.checkout) return;

    const publicKey = document.head.querySelector("meta[name='stripe-public-key']").content;
    const stripe = Stripe(publicKey);

    const fetchClientSecret = async () => {
      const response = await post(this.urlValue);
      const { clientSecret } = await response.json();
      return clientSecret;
    };

    this.checkout = await stripe.initEmbeddedCheckout({ fetchClientSecret });
    this.checkout.mount(this.element);
  }

  disconnect() {
    if (this.checkout) {
      this.checkout.destroy();
      this.checkout = null;
    }
  }
}
