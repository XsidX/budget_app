import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["openNewCategory", "leaveModal"]

    connect() {
        console.log("connected")
        this.openNewCategoryTarget.addEventListener('click', () => this.openNewCategory())
        this.leaveModalTarget.addEventListener('click', () => this.leaveModal())
    }

    openNewCategory() {
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