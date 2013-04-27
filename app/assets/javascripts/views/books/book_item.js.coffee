#This is a comment 
class App.Views.BooksItem extends Backbone.View
    
    #template to use
    template : JST['views/books/book']
    
    #events to catch 
    events:
        "click .destroy" : "destroy"
    
    #the code will be wrapped in this element
    tagName : "tr"
    
    #constructor
    initialize: () ->
        _.bindAll(this)
        #alert 'Book item initialized'
        @render()
    
    #method for destroying a model ( here a book ) 
    destroy: () ->
        @model.destroy()
        this.remove()
        return false

    render: ->
        #alert 'book item render function'
        @$el.html @template( @model.toJSON())
        @
