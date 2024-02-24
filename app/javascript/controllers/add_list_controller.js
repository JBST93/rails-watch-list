import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    title: String,
    year: Number,
    poster: String
  }

  create(data) {
    fetch(`${window.location.href}/bookmarks`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
      },
      body: data
    })
    .then(window.location.reload())
    .then(data => console.log('Success:', data))
    .then(window.location.reload)
    .catch((error) => console.error('Error:', error));
  }

  add() {
    const title = this.titleValue
    const year =  this.yearValue
    const poster_url = this.posterValue
    const data = JSON.stringify({
      movie: {
        title: title,
        poster_url: poster_url
      }
    })
    this.create(data)
  }
}
