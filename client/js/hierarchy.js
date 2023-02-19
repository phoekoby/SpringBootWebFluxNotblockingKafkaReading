'use strict'

export default class Hierarchy {

    #data = undefined

    constructor() {

    }

    getData() {
        return new Promise(async (resolve, reject) => {
            if(this.#data !== undefined){
                resolve(this.#data)
            }else{
                try{
                    const f = await fetch('http://localhost:8080/blocking-api/mappings')
                    this.#data = await f.json()
                }catch (e) {
                    this.#data = []
                    console.error(e)
                }
                resolve(this.#data)
            }
        })
    }

}

