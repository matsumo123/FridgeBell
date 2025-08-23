import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="details-modal"
export default class extends Controller {
  static targets = ["detailModal", "item"]

  connect(){
  }

  populate(event){
    const selections = event.detail?.selections;
    // selectionsが空の場合はreturn
    if(!Array.isArray(selections) || selections.length === 0) {
      return this.detailModalTarget.classList.add("hidden");
    }
    // selectionsのindexを文字列としてmap
    const selected = new Set(selections.map(s => String(s.index)));
    // selectionsのindexと食材のindexが一致した場合は表示、しない場合は非表示
    this.itemTargets.forEach(item => {
      const idx = item.dataset.index;
      const fields = item.querySelectorAll('input, select, textarea');
      if(selected.has(idx)) {
        item.classList.remove("hidden");
        fields.forEach(f => f.disabled = false);
      } else {
        item.classList.add("hidden");
        fields.forEach(f => f.disabled = true);
      }
    })
    // モーダルを開く
    this.detailModalTarget.classList.remove("hidden");
  }

  close(event){
    const form = event.target;
    const owningForm = this.element.closest(`form`);

    if(form !== owningForm) return;

    if(event.detail.success){
      this.detailModalTarget.classList.add("hidden");
      Turbo.visit("/user_foods");
    }
  }

  closeModal(){
    this.detailModalTarget.classList.add("hidden");
  }
}
