import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="foods-selection"
export default class extends Controller {
  static targets = ["quantity", "nextButton"]

  connect() {
    this.check();
  }

  open(){
    // 空の配列
    let selections = [];
    // 数量を取り出して、0より大きい値のとき、インデックスと数量を空の配列に追加
    this.quantityTargets.forEach((element) => {
      const idx = element.dataset.index;
      const n = Number(element.value || "0");
      if (n > 0) {
        selections.push({ index: idx, quantity: n});
      }
    })
    if (selections.length !== 0) {
      // 数量の値をdetails-modalに引き渡す
      const event = new CustomEvent("foods:selected", { detail: { selections }, bubbles: true })
      this.element.dispatchEvent(event);
    }
  }

  check(){
    // 空の配列
    let presentQuantities = [];
    // 数量を1つずつ取り出して、文字列を数値化し、空の配列に追加していく
    this.quantityTargets.forEach((element) => {
      presentQuantities.push(Number(element.value || "0"));
    });
    // presentQuantitiesの配列の値が0よりも大きい値があればtrue
    const any = presentQuantities.some((element) => element > 0);
    // anyがtrueの場合に限り、ボタンを押せる(disabled = false)
    this.nextButtonTarget.disabled = !any;
  }
}
