'use strict'

export class Signal {

    #name
    #log = {}
    #updates = []
    #exhauster_id

    constructor(ex_id, name) {
        this.#name = name
        this.#exhauster_id = ex_id
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

    get(){
        return this
    }

    getName(){
        return this.#name
    }

    getExhausterId(){
        return this.#exhauster_id
    }

    getUpdates(){
        const upd = {}
        this.#updates.forEach(moment => upd[moment] = this.#log[moment])
        return upd
    }

}

