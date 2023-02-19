'use strict'

import {Signal} from "/client/js/signal.js";

export class Exhauster {

    #signals = {}
    #updates = []

    constructor(signals) {
        if(!signals.length && signals.length !== 0){
            throw new Error('Invalid exhauster data')
        }
        this.addSignals(signals)
    }

    getSignals(){
        const obj = {}
        Object.keys(this.#signals).forEach(key => {
            obj[key] = this.#signals[key].getInfo()
        })
        return obj
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
                this.#signals[comment] = new Signal(comment)
            }
            this.#signals[comment].addInfo(moment, signal)
            this.#updates.push(comment)
        }
    }

    addSignals(ss) {
        ss.forEach(s => this.addSignal(s))
    }


}

