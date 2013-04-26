class App.Views.BooksEditView extends Backbone.View

  template: JST["views/books/aaabook_edit"]

  el: '#app'

  events:
    "submit #edit-book" : "update"

  initialize:(options )->
    #alert "initiliaze"
    @render()

  render: ->
    #alert "rendering"
    @$el.html @template(@model.toJSON())
    @

  update:(e) ->
    #alert "Updating"
    e.preventDefault()
    e.stopPropagation()
    name = $('#title').val()
    author = $('#author').val()
    status = $('#status').val()
    @model.save({ name : name, author : author , status : status },
                success: (post) =>
                    @model = post
                    window.location.hash = "")

  destroy:->
    #alert "destroying previous"
    this.undelegateEvents();
    #@$el.removeData().unbind(); 
    #@remove();  
    #Backbone.View.prototype.remove.call(this);
    #@unbind()

