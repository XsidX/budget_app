import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["openBottomModal", "leaveModal"]

    connect() {
        console.log("modals controller connected")
        this.openBottomModalTarget.addEventListener('click', () => this.openBottomModal())
        this.leaveModalTarget.addEventListener('click', () => this.leaveModal())
    }

    openBottomModal() {
        const overlay = document.getElementById('overlay')
        const newCategoryModal = document.getElementById('new-category-modal')
        enter(newCategoryModal)
        enter(overlay)
    }

    leaveModal() {
        const overlay = document.getElementById('overlay')
        const newCategoryModal = document.getElementById('new-category-modal')
        leave(newCategoryModal)
        leave(overlay)
    }


}