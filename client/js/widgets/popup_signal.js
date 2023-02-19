'use strict'

import PopupBaseWidget from "/client/js/widgets/popup_base.js";
import App from '/client/js/app.js';

export default class PopupSignalWidget extends PopupBaseWidget {

    #signal

    constructor(signal) {
        if(!signal){
            throw new Error('Invalid signal')
        }
        super();
        this.#signal = signal
        this.setTitle(signal.getName())
    }

    getClasses() {
        return ['popup', 'popup-signal']
    }

    renderWidget({_updates}) {
        const exhauster_updates = _updates[this.#signal.getExhausterId()] || []
        const updates = exhauster_updates[this.#signal.getName()] || false
        if(!updates){
            return
        }
        const children = this.getChildren()
        // Object.keys(exhauster_updates).forEach(key => {
        //     if(!children[key]) return
        //     children[key].renderWidget({signal_updates: exhauster_updates[key]})
        // })

        this.getContent().innerHTML = 'popup.....'
    }

}

