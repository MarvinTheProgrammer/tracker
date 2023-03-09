import Chart from "./node_modules/chart.js";

class LineChart {
    constructor(context, labels, values) {
        this.chart = new Chart(context, {
            type: "line",
            data: {
                labels: labels,
                datasets: [
                    {
                        label: "User",
                        data: values,
                        borderColor: "#4c51bf"
                    }
                ]
            },
            options: {
                scales: {
                    xAxes: [
                        {
                            ticks: {
                                fontStyle: "bold",
                                fontSize: 14,
                            },
                        },
                    ],
                    yAxes: [
                        {
                            ticks: {
                                suggestedMin: 130,
                                suggestedMax: 180,
                                fontStyle: "bold",
                                fontSize: 14,
                            },
                        },
                    ],
                },
            },
        });
    }

    addPoint(label, value) {
        const labels = this.chart.data.labels;
        const data = this.chart.data.dataset[0].data;

        labels.push(label);
        data.push(value);

        if (data.length > 7) {
            data.shift();
            labels.shift();
        }

        this.chart.update();
    }
}
export default LineChart;