'use strict'

import PopupBaseWidget from "/client/js/widgets/popup_base.js";
import App from '/client/js/app.js';

export default class PopupSignalWidget extends PopupBaseWidget {

    #signal
    #graphic

    constructor(signal) {
        if(!signal){
            throw new Error('Invalid signal')
        }
        super();
        this.#signal = signal
        this.setTitle(signal.getName())
        this.getContent().innerHTML = '<canvas id="myChart' + encodeURIComponent(this.#signal.getName()) + '"></canvas>'
    }

    initGraphic = () => {
        const ctx = document.getElementById('myChart' + encodeURIComponent(this.#signal.getName()));

        const info = this.#signal.getInfo()
        const labels = Object.keys(info).map(l => l*1).sort()
        this.#graphic = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels.map(l => this.formatDate(new Date(l*1))),
                datasets: [{
                    label: this.#signal.getName(),
                    data: labels.map(l => info[l].value * 1),
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        console.log(this.#graphic)
    }

    updateGraphic = () => {
        const info = this.#signal.getInfo()
        console.log('updateGraphic', info)
        const labels = Object.keys(info).map(l => l*1).sort()
        this.#graphic.data.labels = labels.map(l => this.formatDate(new Date(l * 1)))
        this.#graphic.data.datasets[0].data = labels.map(l => info[l].value * 1)
        this.#graphic.update()
    }

    formatDate(date) {

        var dd = date.getDate();
        if (dd < 10) dd = '0' + dd;

        var mm = date.getMonth() + 1;
        if (mm < 10) mm = '0' + mm;

        var yy = date.getFullYear() % 100;
        if (yy < 10) yy = '0' + yy;

        let H = date.getHours()
        if (H < 10) H = '0' + H;

        let i = date.getMinutes()
        if (i < 10) i = '0' + i;

        let s = date.getSeconds()
        if (s < 10) s = '0' + s;

        return `${dd}.${mm}.${yy} ${H}:${i}:${s}`;
    }

    getClasses() {
        return ['popup', 'popup-signal']
    }

    renderWidget({updates}) {

        if(!this.#graphic){
            this.initGraphic()
        }
        this.updateGraphic()
        const exhauster_updates = updates[this.#signal.getExhausterId()] || []
        updates = exhauster_updates[this.#signal.getName()] || false
        if(!updates){
            return
        }
        const children = this.getChildren()
        // Object.keys(exhauster_updates).forEach(key => {
        //     if(!children[key]) return
        //     children[key].renderWidget({signal_updates: exhauster_updates[key]})
        // })

        // this.getContent().innerHTML = 'popup.....'
    }

}

