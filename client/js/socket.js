'use strict'

export class Socket {

    #socket
    #eventSource

    constructor(...args) {
        // localhost:8080/api/exgausters-realtime
        //let eventSource = new EventSource("http://localhost:8080/api/exgausters-history-with-realtime?page=1&size=10000")
        let eventSource = new EventSource("http://localhost:8080/api/exgausters-history?page=1&size=10000")
        this.#eventSource = eventSource

        const socket = new io(...args)
        this.#socket = socket
    }

    on(type, callback) {
        if(type !== 'init' && type !== 'update'){
            this.#socket.on(type, callback)
        }
    }

    onInit(callback){
        this.#socket.on('init', callback)
    }

    onUpdate(callback){
        //this.#socket.on('update', callback)
        this.#eventSource.addEventListener('OutputExgausterMomentDto', event => {
            callback([JSON.parse(event.data)])
        })
    }

    emit(event, ...args){
        if(event){
            this.#socket.emit(event, ...args)
        }
    }

}

