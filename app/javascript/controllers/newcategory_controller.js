import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("new cat controller connected")
    this.getIconName()
  }

  getIconName() {
    // refresh the page when the fileName changes
    document.getElementById('category_icon').addEventListener('change', () => {
      const fileName = document.getElementById('category_icon').value.split("\\")[2]
      document.getElementById('show-file-name').textContent = fileName
    })
  }
}
