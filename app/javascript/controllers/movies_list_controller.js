import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select';

// Connects to data-controller="movies-list"
export default class extends Controller {
  connect() {
    console.log("Hello from movies_list_controller");
    TomSelect("#bookmark_movie_id",{
      create: true,
      sortField: {
        field: "title",
        direction: "asc"
      }
    });
  }

}
