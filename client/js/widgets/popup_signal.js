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
        const labels = Object.keys(info)
        this.#graphic = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels.map(l => new Date(l)),
                datasets: [{
                    label: '',
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
        const labels = Object.keys(info)
        this.#graphic.data.labels = labels.map(l => new Date(l))
        this.#graphic.data.datasets[0].data = labels.map(l => info[l].value * 1)
        this.#graphic.update()
        debugger
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

