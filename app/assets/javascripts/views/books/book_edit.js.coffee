class App.Views.BooksEditView extends Backbone.View
  
  #template to use for rendering
  template: JST["views/books/aaabook_edit"]

  #parent element
  el: '#app'

  #events to catch
  events:
    "submit #edit-book" : "update"

  #constructor
  initialize:(options )->
    #alert "initiliaze"
    @render()
  

  #rendering function 
  render: ->
    #alert "rendering"
    @$el.html @template(@model.toJSON())
    @

  #this function updates the model in Backbone collection as well as sends a post request to the server
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

  #This function unbinds this view object's events 
  destroy:->
    this.undelegateEvents();
    #@$el.removeData().unbind(); 
    #@remove();  
    #Backbone.View.prototype.remove.call(this);
    #@unbind()

