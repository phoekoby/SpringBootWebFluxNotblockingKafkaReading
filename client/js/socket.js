'use strict'

export class Socket {

    #socket

    constructor(...args) {
        // localhost:8080/api/exgausters-realtime
        let eventSource = new EventSource("localhost:8080/api/exgausters-realtime");

        eventSource.onmessage = function(event) {
            console.log("Новое сообщение", event);
            // этот код выведет в консоль 3 сообщения, из потока данных выше
        }
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

