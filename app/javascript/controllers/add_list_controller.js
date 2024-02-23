import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    title: String,
    year: Number,
    poster: String
  }

  store(data) {
    fetch('/movies', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
      },
      body: data
    })
    .then(response => response.json())
    .then(data => console.log('Success:', data))
    .catch((error) => console.error('Error:', error));
    console.log("Sending data to controller")
  }

  add() {
    console.log("I am adding..")
    const title = this.titleValue
    const year =  this.yearValue
    const poster_url = this.posterValue
    const data = JSON.stringify({
      movie: {
        title: title,
        // year: year,
        poster_url: poster_url
      }
    })

    console.log(data)

    this.store(data)


  }
}
