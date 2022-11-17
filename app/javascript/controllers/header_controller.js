import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["openMenu"]

    connect() {
        console.log("connected")
        this.openMenuTarget.addEventListener('click', () => this.openMenuModal())
    }

    openMenuModal() {
        const menuModal = document.getElementById('menu-modal')
        enter(menuModal)
    }

}