'use strict'

export class Socket {

    #socket

    constructor(...args) {
        // localhost:8080/api/exgausters-realtime
        let eventSource = new EventSource("http://localhost:8080/api/exgausters-realtime")
        eventSource.addEventListener('message', event => {
            console.log({event})
        })
        eventSource.onmessage = (...args) => console.log(args)
        console.log({eventSource})

        const socket = new io(...args)
        console.log(socket)


        socket.on('update', (...args) => {
            //console.log('socket update', ...args)
        })
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
        this.#socket.on('update', callback)
    }

    emit(event, ...args){
        if(event){
            this.#socket.emit(event, ...args)
        }
    }

}

