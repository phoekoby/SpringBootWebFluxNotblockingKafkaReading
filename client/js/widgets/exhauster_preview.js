'use strict'

import Widget from "/client/js/widget.js";
import SignalPreviewWidget from "/client/js/widgets/signal_preview.js";
import PopupExhausterWidget from "/client/js/widgets/popup_exhauster.js";
import App from '/client/js/app.js';

export default class ExhausterPreviewWidget extends Widget {

    #key
    #dynamic_content
    #button
    #display_signals_amount = 10

    constructor(key) {
        super();
        this.#key = key
        this.getElement().innerHTML = `<p>Exhauster №${key}</p>`

        this.#dynamic_content = document.createElement('div')
        this.#dynamic_content.classList.add('widget-exhauster-preview-wrapper')

        this.#button = document.createElement('div')
        this.#button.classList.add('widget-exhauster-preview-button')
        this.#button.innerText = '>'

        this.addListeners()
        this.getElement().append(this.#dynamic_content, this.#button)
    }

    addListeners = () => {
        this.#button.addEventListener('click', e => {
            App.getInstance().openPopup("exhauster_" + this.#key, new PopupExhausterWidget(this.#key))
        })
    }

    getClasses() {
        return ['widget-exhauster-preview']
    }

    setDisplaySignalsAmount(amount){
        this.#display_signals_amount = Math.max(0, amount * 1)
    }

    renderWidget({exhauster_updates}) {
        const children = this.getChildren()
        Object.keys(exhauster_updates).slice(0, this.#display_signals_amount).forEach(key => {
            if(!children[key]){
                const child = new SignalPreviewWidget(key)
                children[key] = child
                this.#dynamic_content.appendChild(child.getElement())
            }
            children[key].renderWidget({signal_updates: exhauster_updates[key]})
        })
    }

}

