import { Controller } from '@hotwired/stimulus'
import { Chart, registerables } from 'chart.js'
Chart.register(...registerables)

export default class extends Controller {
    static targets = ['canvas']

    connect() {
        const element = this.canvasTarget
        const data = {
            labels: [
                '対応満足',
                '売却価格',
                '売却スピード'
            ],
            datasets: [{
                label: '平均満足度',
                data: [4, 4.5, 5],
                fill: true,
                backgroundColor: 'rgba(245, 158, 11, 0.3)',
                borderColor: 'rgb(245, 158, 11)',
                pointBackgroundColor: 'rgb(245, 158, 11)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(245, 158, 11)'
            }]
        }
        this.chart = new Chart(element.getContext('2d'), {
            type: 'radar',
            data: data,
            options: {
                scales: {
                    r: {
                        min: 0,
                        max: 5,
                        ticks: {
                            stepSize: 1
                        },
                        pointLabels: {
                            font: {
                                size: 15
                            }
                        },
                        grid: {
                            color: '#64748b'
                        },
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        })
    }

    disconnect() {
        this.chart.destroy()
        this.chart = undefined
    }
}