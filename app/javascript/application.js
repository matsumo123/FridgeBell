// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Chart from "chart.js/auto"
import ChartDataLabels from "chartjs-plugin-datalabels"
Chart.register(ChartDataLabels)
import "chartkick/chart.js"
