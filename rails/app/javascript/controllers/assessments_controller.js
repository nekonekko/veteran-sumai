import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    // static classes = ["exclusiveArea", "landArea", "buildingArea"]

    static targets = ["exclusiveArea", "landArea", "buildingArea"]

    modify(event) {
        if (event.params["type"] == "マンション") {
            this.exclusiveAreaTarget.classList.remove("hidden")
            this.exclusiveAreaTarget.classList.add("block")
            this.landAreaTarget.classList.remove("block")
            this.landAreaTarget.classList.add("hidden")
            this.buildingAreaTarget.classList.remove("block")
            this.buildingAreaTarget.classList.add("hidden")
        } else if (event.params["type"] == "戸建て") {
            this.exclusiveAreaTarget.classList.remove("block")
            this.exclusiveAreaTarget.classList.add("hidden")
            this.landAreaTarget.classList.remove("hidden")
            this.landAreaTarget.classList.add("block")
            this.buildingAreaTarget.classList.remove("hidden")
            this.buildingAreaTarget.classList.add("block")
        } else if (event.params["type"] == "土地") {
            this.exclusiveAreaTarget.classList.remove("block")
            this.exclusiveAreaTarget.classList.add("hidden")
            this.landAreaTarget.classList.remove("hidden")
            this.landAreaTarget.classList.add("block")
            this.buildingAreaTarget.classList.remove("block")
            this.buildingAreaTarget.classList.add("hidden")
        }
    }
}
