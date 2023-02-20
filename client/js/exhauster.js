'use strict'

import {Signal} from "/client/js/signal.js";
import App from "/client/js/app.js";

export class Exhauster {

    #signals = {}
    #updates = []
    #id

    constructor(id, signals) {
        if((!signals.length && signals.length !== 0) || id*1 < 0){
            throw new Error('Invalid exhauster data')
        }
        this.#id = id
        this.addSignals(signals)
        setTimeout(() => {
            const all_signals = App.getInstance().getSignalsForExhausterFromHierarchy(id)
            all_signals.forEach(({comment}) => {
                this.#signals[comment] = this.#signals[comment] || new Signal(id, comment)
            })
        }, 0)
    }

    getSignals(){
        const obj = {}
        Object.keys(this.#signals).forEach(key => {
            obj[key] = this.#signals[key].getInfo()
        })
        return obj
    }

    getSignalById(id){
        return this.#signals[id]
    }

    getUpdateSignals(){
        const obj = {}
        this.#updates.forEach(key => {
            obj[key] = this.#signals[key].getUpdates()
        })
        return obj
    }

    purgeUpdates(){
        this.#updates.forEach(key => {
            this.#signals[key].purgeUpdates()
        })
        this.#updates = []
    }

    addSignal(s) {
        const {comment, moment, ...signal} = s
        //console.log({comment, moment, signal})
        if(comment){
            if(!this.#signals[comment]){
                this.#signals[comment] = new Signal(this.#id, comment)
            }
            this.#signals[comment].addInfo(moment, signal)
            this.#updates.push(comment)
        }
    }

    addSignals(ss) {
        ss.forEach(s => this.addSignal(s))
    }


}

