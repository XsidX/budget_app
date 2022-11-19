import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("sessions controller connected")
        this.getAvatarName()
    }

    getAvatarName() {
        // refresh the page when the fileName changes
        document.getElementById('user_avatar').addEventListener('change', () => {
            const avatarName = document.getElementById('user_avatar').value.split("\\")[2]
            document.getElementById('show-avatar-name').textContent = avatarName
        })
    }
}
