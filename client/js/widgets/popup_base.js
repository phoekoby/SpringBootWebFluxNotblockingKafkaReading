'use strict'

import Widget from "/client/js/widget.js";

export default class PopupBaseWidget extends Widget {
    
    #visible = false
    #close_btn
    #content
    #title
    #onclose = () => {}
    
    constructor(widgets) {
        widgets = widgets || []
        super();
        this.#close_btn = document.createElement('div')
        this.#close_btn.classList.add('widget-popup-close')
        this.#close_btn.innerHTML = '+'

        this.#title = document.createElement('h4')
        this.#title.classList.add('widget-popup-title')
        
        this.#content = document.createElement('div')
        this.#content.classList.add('widget-popup-content')
        
        this.addEventListeners()
        this.getElement().append(this.#title, this.#content, this.#close_btn)

        Object.keys(widgets).forEach(key => {
            this.getChildren()[key] = widgets[key]
            this.#content.appendChild(widgets[key].getElement())
        })
    }
    
    addEventListeners(){
        this.#close_btn.addEventListener('click', e => {
            this.close()
        })
    }
    
    open(){
        this.#visible = true
        this.getElement().style.display = 'block'
    }
    
    close(){
        this.#visible = false
        this.getElement().style.display = 'none'
        this.#onclose()
        this.destructor()
    }

    getContent(){
        return this.#content
    }

    setTitle(title) {
        this.#title.innerHTML = title
    }

    onClose(callback){
        this.#onclose = callback
    }

    renderWidget() {}

}

