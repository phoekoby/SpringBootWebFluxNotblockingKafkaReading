'use strict'

export class Signal {

    #name
    #log = {}
    #updates = []

    constructor(name) {
        this.#name = name
    }

    addInfo(moment, signal){
        this.#log[moment] = signal
        this.#updates.push(moment)
        const keys = Object.keys(this.#log)
        if(keys.length > 4000){
            keys.sort().slice(0, 2000).forEach(key => {
                delete this.#log[key]
            })
        }
    }

    purgeUpdates(){
        this.#updates = []
    }

    getInfo(){
        return this.#log
    }

    getUpdates(){
        const upd = {}
        this.#updates.forEach(moment => upd[moment] = this.#log[moment])
        return upd
    }

}

