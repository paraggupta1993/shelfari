#This is a comment 
class App.Views.BooksItem extends Backbone.View
    
    template : JST['views/books/book']
    
    #el : '#app'
    
    events:
        "click .destroy" : "destroy"
    
    tagName : "tr"
    
    initialize: () ->
        _.bindAll(this)
        #alert 'Book item initialized'
        @render()
    
    destroy: () ->
        @model.destroy()
        this.remove()
        return false

    render: ->
        #alert 'book item render function'
        @$el.html @template( @model.toJSON())
        @
