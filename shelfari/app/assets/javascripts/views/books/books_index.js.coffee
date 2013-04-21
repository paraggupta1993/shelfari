#This file will render our list of books. Internally calls to render each book separately.

##= require ./book_item
class App.Views.BooksIndex extends Backbone.View
  #This is the template (layout) our backbone view would use.
  template: JST['/books/index']
  el : '#app'
  initialize : (options) ->
    alert 'initializer of booksindex'
    @render()
    @addAll()

  render: ->
    alert "rendering book-index"
    @$el.html @template
    #returning this. @ is alias for 'this' in coffee
    @

  addAll: ->
    alert "adding all"
    @collection.forEach( @addOne , @ )
  
  addOne:(book) ->
    alert "adding one"
    @view = new App.Views.BooksItem( { model : book })
    @$el.find('tbody').append @view.render().el 

