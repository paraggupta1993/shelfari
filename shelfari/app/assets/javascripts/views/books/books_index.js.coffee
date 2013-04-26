#This file will render our list of books. Internally calls to render each book separately.

##= require ./book_item
class App.Views.BooksIndex extends Backbone.View
  #This is the template (layout) our backbone view would use.
  template: JST['views/books/book_index']

  el : '#app'

  initialize : (options) ->
    _.bindAll( this )
    #alert 'initializer of booksindex'
    @render()
    @addAll()

  render: ->
    #alert "rendering book-index"
    #$(this.el).html( @template()).done( @addAll )
    $(this.el).html(@template())
    #returning this. @ is alias for 'this' in coffee
    return this

  addAll:->
    #Try to find a workaround, here jquery race situation occurs. the 'table' is rendered with jquery in the above render function. The same 'table' will be used in addOne function. If it doesnot load in time, the books won't be added. 
    #alert "addall"
    # The above issue is resolved using "until" loop in addOne function 
    
    @collection.forEach( @addOne , @ )
  
  addOne:(book) ->
    #alert "adding one"
    @view = new App.Views.BooksItem( { model : book } )
    #@$el.find('tbody').append @view.render().el 
    until temp 
      temp = $('#bookstable').append @view.render().el
