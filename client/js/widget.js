'use strict'

export default class Widget {

    children = {}
    element

    constructor() {
        this.element = document.createElement(this.getElementTag())
        this.element.classList.add('widget', ...this.getClasses())
        console.log('widget created', this)
    }

    getElement(){
        return this.element
    }

    getChildren(){
        return this.children
    }

    renderWidget(data){

    }

    getClasses() {
       return []
    }

    getElementTag(){
        return 'div'
    }

    destructor(){
        this.element.remove()
    }

}

