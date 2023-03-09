import LineChart from "./line_chart.js"

let Hooks = {};

Hooks.LineChart = {
    mounted() {
        console.log(this.el)
        console.log(this.el.dataset)
        const { labels, values } = JSON.parse(this.el.dataset.chart);
        this.chart = new LineChart(this.el, labels, values)
    }
}
export default Hooks;