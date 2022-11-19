import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    static targets = ["selectCategory"]

    connect() {
        console.log("connected")
        this.selectCategoryTarget.addEventListener('click', () => this.toggleSelectCategoryDropdown())
    }

    toggleSelectCategoryDropdown() {
        const selectCategoryDropdown = document.getElementById('select-category-dropdown')
        toggle(selectCategoryDropdown)
    }

}