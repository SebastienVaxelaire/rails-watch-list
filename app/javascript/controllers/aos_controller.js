import { Controller } from "@hotwired/stimulus"
import AOS from "aos"

export default class extends Controller {
  connect() {
    this.initializeAOS();
    this.observeScroll();
  }

  initializeAOS() {
    AOS.init();
  }

  observeScroll() {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          AOS.refresh();
          console.log("coucou")
        }
      });
    });

    observer.observe(this.element);
  }
}
