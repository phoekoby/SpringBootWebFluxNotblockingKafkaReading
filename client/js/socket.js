'use strict'

export class Socket {

    #socket

    constructor(...args) {
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

