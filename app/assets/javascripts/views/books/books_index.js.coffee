#This file will render our list of books. Internally calls to render each book separately.

##= require ./book_item
class App.Views.BooksIndex extends Backbone.View
  #This is the template (layout) our backbone view would use.
  template: JST['views/books/book_index']
  
  events:
    'keypress #search' : 'search'

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
    #alert "addall"
    @collection.forEach( @addOne , @ )
  
  addOne:(book) ->
    @view = new App.Views.BooksItem( { model : book } )
    #@$el.find('tbody').append @view.render().el 
    temp = $('#bookstable').append @view.render().el

  isMatch:(  book  )->
    #if @search_val == book.get("name")
    #    @addOne book 
    ret_val = book.get("name").search @search_val
    if ret_val != -1 
       @addOne book 
    
  search:(e) ->
    return if e.keyCode != 13 
    @search_val = @$('#search').val()
    $('#bookstable').empty()
    #alert "Table should be empty"
    @collection.each( @isMatch , @ ) 
        

    
