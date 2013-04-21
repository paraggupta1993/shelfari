#This is a comment 
class App.Views.BooksItem extends Backbone.View

    template : JST['book']
    events:
        "click .destroy" : "destroy"
    
    tagName: "tr"
    initialize: ->
        @render()
    destroy: () ->
        @model.destroy()
        this.remove()
        return false

    render: ->
        @$el.html(@template(@model.toJSON()))
        return this
