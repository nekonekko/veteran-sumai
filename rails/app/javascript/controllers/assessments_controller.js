import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["exclusiveArea", "landArea", "buildingArea"]

    // マンション用では専有面積のみ表示
    showAreasForApartment() {
        this.exclusiveAreaTarget.classList.remove("hidden")
        this.landAreaTarget.classList.add("hidden")
        this.buildingAreaTarget.classList.add("hidden")
    }

    // 戸建てでは土地面積と建物面積を表示
    showAreasForHouse() {
        this.exclusiveAreaTarget.classList.add("hidden")
        this.landAreaTarget.classList.remove("hidden")
        this.buildingAreaTarget.classList.remove("hidden")
    }

    // 土地では土地面積のみ表示
    showAreasForLand() {
        this.exclusiveAreaTarget.classList.add("hidden")
        this.landAreaTarget.classList.remove("hidden")
        this.buildingAreaTarget.classList.add("hidden")
    }

    modify(event) {
        if (event.params["type"] === "マンション") {
            this.showAreasForApartment()
        } else if (event.params["type"] === "戸建て") {
            this.showAreasForHouse()
        } else if (event.params["type"] === "土地") {
            this.showAreasForLand()
        }
    }
}
