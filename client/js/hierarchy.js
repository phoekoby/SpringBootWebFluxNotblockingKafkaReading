'use strict'

export default class Hierarchy {

    #data

    constructor() {
        this.fetchInfo()
    }

    fetchInfo = async () => {
        const f = await fetch('http://localhost:8080/blocking-api/mappings')
        this.#data = await f.json()
    }

}

