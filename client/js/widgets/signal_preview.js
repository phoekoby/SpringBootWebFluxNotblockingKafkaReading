'use strict'

import Widget from "/client/js/widget.js";

export default class SignalPreviewWidget extends Widget {

    #key
    #static_text
    #dynamic_content

    constructor(key) {
        super();
        this.#key = key
        this.#static_text = document.createElement('span')
        this.#dynamic_content = document.createElement('span')

        this.#static_text = this.#key + ': '

        this.getElement().append(this.#static_text, this.#dynamic_content)
    }

    getClasses() {
        return ['widget-signal-preview']
    }

    getElementTag() {
        return 'p'
    }

    renderWidget({signal_updates}) {
        const moment = Object.keys(signal_updates).map(x => Number.parseFloat(x)).sort().reverse()[0]
        if(!!moment) {
            const html = signal_updates[moment].value
            if(html !== this.#dynamic_content.innerHTML){
                this.#dynamic_content.innerHTML = html
            }
        }
    }

}

