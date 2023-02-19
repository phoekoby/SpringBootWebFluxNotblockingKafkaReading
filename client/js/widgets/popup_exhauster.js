'use strict'

import PopupBaseWidget from "/client/js/widgets/popup_base.js";
import App from '/client/js/app.js';
import SignalPreviewWidget from "/client/js/widgets/signal_preview.js";

export default class PopupExhausterWidget extends PopupBaseWidget {

    #key

    constructor(key) {
        super();
        this.#key = key
        this.setTitle(`Exhauster №${key}: Информация`)
        this.createNecessarySignals()
    }

    getClasses() {
        return ['popup', 'popup-exhauster']
    }

    createNecessarySignals = (signals=null) => {
        const children = this.getChildren()
        signals = signals ? signals : App.getInstance().getExhausterById(this.#key).getSignals()
        Object.keys(signals).forEach(key => {
            children["" + key] = children["" + key] || new SignalPreviewWidget(key)
            this.getContent().appendChild(children["" + key].getElement())
        })
    }

    renderWidget({updates}) {
        const exhauster_updates = updates[this.#key] || []
        this.createNecessarySignals(exhauster_updates)
        //const exhauster = App.getInstance().getExhausterById(this.#key)
        const children = this.getChildren()
        Object.keys(exhauster_updates).forEach(key => {
            if(!children[key]) return
            children[key].renderWidget({signal_updates: exhauster_updates[key]})
        })

        //this.getContent().innerHTML = 'popup.....'
    }

}

