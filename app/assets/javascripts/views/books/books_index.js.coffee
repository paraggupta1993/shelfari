#This file will render our list of books. Internally calls to render each book separately.

##= require ./book_item
class App.Views.BooksIndex extends Backbone.View
  #This is the template (layout) our backbone view would use.
  template: JST['views/books/book_index']
  
  #catching events
  events:
    'keypress #search' : 'search'

  #parent element
  el : '#app'

  #constructor
  initialize : (options) ->
    _.bindAll( this )
    #alert 'initializer of booksindex'
    @render()
    @addAll()

  
  render: ->
    #alert "rendering book-index"
    $(this.el).html(@template())
    #returning this. @ is alias for 'this' in coffee
    return this

  addAll:->
    #alert "addall"
    @collection.forEach( @addOne , @ )
  
  addOne:(book) ->
    
    @view = new App.Views.BooksItem( { model : book } )
    temp = $('#bookstable').append @view.render().el

  isMatch:(  book  )->
    
    #Searching for @search_val pattern in book's name 
    ret_val = book.get("name").search @search_val  
    #if search is matched a non-negative index where the match occurs is returned
    if ret_val != -1 
       @addOne book 
    
  search:(e) ->
    return if e.keyCode != 13 
    
    #Excute below only if 'Enter key' is pressed
    
    @search_val = @$('#search').val()
    $('#bookstable').empty()
    @collection.each( @isMatch , @ ) 
    
