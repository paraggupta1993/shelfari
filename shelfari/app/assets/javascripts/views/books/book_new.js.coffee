#comment
class App.Views.BooksNewView extends Backbone.View
 
 el: '#app'
 #A funny thing : allows give lexographically smaller name to your template than the files which use that template. 
 #
 template: JST['views/books/aaanewbook']

 events:
   "submit #new-book": "save"

 initialize: ->
   _.bindAll(this)
   alert 'New book init function'
   @render()

 render: ->
   @$el.html @template()
   @ 

 save: (e) ->
   alert 'Saving book'
   e.preventDefault()
   e.stopPropagation()
   name = $('#title').val()
   author = $('#author').val()
   status = $('#status').val()
   model = new App.Models.Book({ name: name, author: author , status : status})
   @collection.create model,
         success: (post) =>
           @model = post
           window.location.hash = "/#{@model.id}"
