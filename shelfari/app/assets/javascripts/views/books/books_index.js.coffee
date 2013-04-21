#This file will render our list of books. Internally calls to render each book separately.

##= require ./book_item
class App.Views.BooksIndex extends Backbone.View
  #This is the template (layout) our backbone view would use.
  template: JST['books/index']
  el : '#app'
  initialize : ->
    @render()
    @addAll()

  render: ->
    alert "rendering book-index"
    @$el.html @template()
    @

  addone:(model) ->
    @view = new App.Views.BooksItem( { model : model })
    @$el.find('tbody').append @view.render().el 

  addAll : ->
    @collection.forEach( @addOne, @ )
