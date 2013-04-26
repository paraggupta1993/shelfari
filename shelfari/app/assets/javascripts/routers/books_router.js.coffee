#alert 'router'
class App.Routers.Books extends Backbone.Router
    initialize: () ->
        @books = new App.Collections.Books
        #alert 'router initialized !'
    routes: 
       # '/index'      : 'index'
       # 'index'       : 'index'
        ''            : 'index'
        'index'       : 'index'
        'new'         : 'new'
        ":id/edit"    : "edit"
        ".*"          : "index"


    new: ->
        #alert 'In books function'
        @new_view = new App.Views.BooksNewView collection : @books

    edit: (id ) ->
        #alert 'Editing route taken'
        #alert id 
        book = @books.get(id)
        if @edit_view 
          #alert @edit_view 
          @edit_view.destroy() 
        @edit_view = new App.Views.BooksEditView  model: book

    index: ->
        #alert 'url catched... will fetch the objects'
        #don't know what the below line does.
        #alert "Fetching the objects"
        @books.fetch()
        ###
        success: (collection) ->
                editor.log "There are now #{collection.length} books in our collection."

  	        error: (collection, response) ->
                editor.log "Server says #{response.status}."
        ###
        @book_index = new App.Views.BooksIndex collection: @books

