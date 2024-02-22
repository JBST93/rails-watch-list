import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["cards", "input"]

  buildHtml = (title, year, poster) => {
    const movieHtml = `<div class="col-lg-3 col-md-4 col-sm-6 col-12">
        <div class="card mb-2">
          <img src="${poster}" class="card-img-top" alt="${title}">
          <div class="card-body">
            <span class="badge bg-primary mb-2">${year}</span>
            <h5 class="card-title">${title}</h5>
          </div>
          <button type="button" class="btn btn-primary">Add to a List</button>
        </div>
      </div>`;
    this.cardsTarget.insertAdjacentHTML("afterbegin", movieHtml);
  }

  fetchMovies = (input) => {
    const url = "http://www.omdbapi.com/";
    const apiKey = "8691812a";

    fetch(`${url}?apikey=${apiKey}&s=${input}`)
      .then((response) => response.json())
      .then((data) => {
      const movies = data.Search
      movies.slice(0, 5).forEach((movie) => {
        const title = movie.Title;
        const poster = movie.Poster;
        const year = movie.Year;
        this.buildHtml(title, year, poster);
      })
    })
  }

  search(event) {
      event.preventDefault();
      this.cardsTarget.innerHTML = "";
      const input = this.inputTarget.value;
      console.log("listening")
      this.fetchMovies(input)
    }
}
