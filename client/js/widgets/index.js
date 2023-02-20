'use strict'

import Widget from "/client/js/widget.js";
import ExhausterPreviewWidget from "/client/js/widgets/exhauster_preview.js";

export class IndexWidget extends Widget {

    constructor() {
        super()
    }

    getClasses() {
        return ['widget-index']
    }

    renderWidget({updates}) {
        const children = this.getChildren()
        const actual_children = Object.keys(updates)
        console.log(actual_children, children)

        actual_children.forEach(key => {
            if(!children["" + key]){
                const child = new ExhausterPreviewWidget(key)
                children["" + key] = child
                this.element.appendChild(child.getElement())
            }
            const child = children["" + key]
            child.renderWidget({exhauster_updates: updates[key]})
        })
        // Object.keys(children).forEach(key => {
        //     if(actual_children.indexOf(key) === -1){
        //         children[key].destructor()
        //         delete children[key]
        //         return
        //     }
        //
        // })
        console.log(this, children)
        //Object.keys(this.children).forEach(key => this.children[key].renderWidget({updates}))
    }

}

