'use strict'

export default class Hierarchy {

    #data = undefined

    constructor() {

    }

    getData() {
        return new Promise(async (resolve, reject) => {
            const cache = localStorage.getItem('hierarchy-json')
            if(cache){
                try{
                    this.#data = JSON.parse(cache)
                }catch (e) {

                }
            }
            if(this.#data !== undefined){
                resolve(this.#data)
            }else{
                try{
                    const f = await fetch('http://localhost:8080/blocking-api/mappings')
                    const text = await f.text()
                    this.#data = JSON.parse(text)
                    localStorage.setItem('hierarchy-json', text)
                }catch (e) {
                    this.#data = []
                    console.error(e)
                }
                resolve(this.#data)
            }
        })
    }

}

