import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["leaveMenu"]

    connect() {
        console.log("connected")
        this.leaveMenuTarget.addEventListener('click', () => this.leaveMenuModal())
    }

    leaveMenuModal() {
        const menuModal = document.getElementById('menu-modal')
        leave(menuModal)
    }

}