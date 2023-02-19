'use strict'

import Widget from "/client/js/widget.js";
import App from '/client/js/app.js';
import PopupSignalWidget from "/client/js/widgets/popup_signal.js";

export default class SignalPreviewWidget extends Widget {

    #key
    #exhauster_id
    #static_text
    #dynamic_content

    constructor(ex_id, key) {
        super();
        this.#exhauster_id = ex_id
        this.#key = key
        this.#static_text = document.createElement('span')
        this.#dynamic_content = document.createElement('span')

        this.#static_text.innerHTML = this.#key + ': '

        this.addEventListeners()
        this.getElement().append(this.#static_text, this.#dynamic_content)
    }

    getClasses() {
        return ['widget-signal-preview']
    }

    getElementTag() {
        return 'p'
    }

    addEventListeners() {
        this.getElement().addEventListener('click', e => {
            App.getInstance().openPopup("signal_" + this.#key, new PopupSignalWidget(this.getSignal()))
        })
    }

    getSignal(){
        return App.getInstance().getExhausterById(this.#exhauster_id).getSignalById(this.#key)
    }

    renderWidget({signal_updates}) {
        const moment = Object.keys(signal_updates).map(x => Number.parseFloat(x)).sort().reverse()[0]
        if(!!moment) {
            const val = signal_updates[moment].value.toFixed(2)
            const diffTime = ((new Date()).getTime() - moment)
            let days = diffTime / (24*60*60*1000);
            let hours = (days % 1) * 24;
            let minutes = (hours % 1) * 60;
            let secs = (minutes % 1) * 60;
            [days, hours, minutes, secs] = [Math.floor(days), Math.floor(hours), Math.floor(minutes), Math.floor(secs)]

            const html = `${val}<br><span class="timediff">(${days}д${hours}ч${minutes}м${secs}с)</span>`
            if(html !== this.#dynamic_content.innerHTML){
                this.#dynamic_content.innerHTML = html
            }
        }
    }

}

