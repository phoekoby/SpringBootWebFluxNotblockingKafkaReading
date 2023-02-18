'use strict'

import {Socket} from "/client/js/socket.js";
import {Exhauster} from "/client/js/exhauster.js";
import {IndexWidget} from "/client/js/widgets/index.js";

class App {

    #exhausters = {}
    #socket
    #app
    #inited = false
    #interval = 0
    #widgets = {}
    #stopped = false

    constructor() {
        if(App.INSTANCE){
            throw new Error('class App is singleton')
        }
    }

    init(){
        if(!this.#interval || this.#interval <= 0){
            throw new Error('No interval set')
        }
        if(this.#inited){
            throw new Error('App already inited')
        }
        this.#app = document.getElementById('app')
        if(!this.#app){
            this.error('No viewport element found')
            throw new Error('No viewport element found by id #app')
        }
        this.refreshConnection()
        this.addWidgets()
        setTimeout(this.render, this.#interval)
        this.#inited = true
    }

    setIntervalTime(ms) {
        this.#interval = ms
    }

    exhausterExists(id) {
        return !!this.#exhausters[id]
    }

    setExhauster(id, exhauster) {
        if(!exhauster || !id) {
            console.log({id, exhauster})
            return
        }
        this.#exhausters[id] = new Exhauster(exhauster)
    }

    refreshConnection = () => {
        this.#socket = new Socket()
        this.#socket.on('disconnect', () => {
            this.stop('Connection lost')
        })
        this.#socket.onUpdate(this.update)
    }

    addWidgets = () => {
        this.#widgets.index = new IndexWidget()


        Object.keys(this.#widgets).forEach(key => {
            this.#app.appendChild(this.#widgets[key].getElement())
        })
    }

    openPopup(key, widget){
        this.#widgets["popup_" + key] = widget
        this.#app.appendChild(widget.getElement())
        widget.onClose(() => {
            delete this.#widgets["popup_" + key]
        })
    }

    getExhausterById(id){
        return this.#exhausters[id]
    }

    update = (_data) => {
        if(this.#stopped) return
        // console.log('app update', this, _data)
        _data = _data.filter(ex => !!ex.exgausterId)
        const data = {}
        _data.forEach(({exgausterId, ...row}) => {
            data[exgausterId] = data[exgausterId] || []
            data[exgausterId].push(row)
        })
        if(!Object.keys(data).length){
            this.stop('Got invalid data. Restart in 5sec')
        }
        Object.keys(data).forEach(id => {
            if(!this.exhausterExists(id)){
                this.setExhauster(id, data[id])
            }else{
                this.#exhausters[id].addSignals(data[id])
            }
        })
    }

    stop = (reason) => {
        this.error(reason)
        console.error(reason)
        this.#socket = null
        this.#stopped = true
        //setTimeout(() => location.reload(), 5000)
    }

    error = (err) => alert(err)

    getUpdates = () => {
        const updates = {}
        Object.keys(this.#exhausters).forEach(key => {
            updates[key] = this.#exhausters[key].getUpdateSignals()
        })
        return updates
    }

    purgeUpdates = () => Object.values(this.#exhausters).forEach(ex => ex.purgeUpdates())

    render = () => {
        if(this.#stopped) return
        const updates = this.getUpdates()
        // console.log(updates)
        // const logs = document.createElement('div')

        // this.#widgets.index.renderWidget({updates})
        Object.keys(this.#widgets).forEach(key => {
            this.#widgets[key].renderWidget({updates})
        })

        // logs.innerHTML = JSON.stringify(updates)
        // this.#app.appendChild(logs)

        this.purgeUpdates()
        setTimeout(this.render, this.#interval)
    }

}
App.INSTANCE = null
App.getInstance = () => {
    if(!App.INSTANCE){
        App.INSTANCE = new App()
    }
    return App.INSTANCE
}

export default App

