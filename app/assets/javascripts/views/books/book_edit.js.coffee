class App.Views.BooksEditView extends Backbone.View

  template: JST["views/books/aaabook_edit"]

  el: '#app'

  events:
    "submit #edit-book" : "update"

  initialize: (options )->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    name = $('#title').val()
    author = $('#author').val()
    status = $('#status').val()
    @model.save({ name : name, author : author , status : status },
                success: (post) =>
                    @model = post
                    window.location.hash = "")
