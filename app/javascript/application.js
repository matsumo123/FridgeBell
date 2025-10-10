// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Chart from "chart.js/auto"
import ChartDataLabels from "chartjs-plugin-datalabels"
Chart.register(ChartDataLabels)

Chart.defaults.set("plugins.datalabels", {
  display: true,
  color: "#fff",
  font: { weight: "bold", size: 32 },
  anchor: "center",
  align: "center",
  formatter: (v) => {
    if(!v || v === 0) return '';
    return `${v}%`
  }
})

import "chartkick/chart.js"
