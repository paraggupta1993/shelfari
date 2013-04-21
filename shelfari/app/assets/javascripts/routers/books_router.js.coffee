#alert 'router'
class App.Routers.Books extends Backbone.Router
    initialize: (options) ->
        alert 'router initialized !'
    routes: 
        '/home/index' : 'index'
        'home/index'  : 'index'
        '/index'      : 'index'
        'index'       : 'index'
        ''            : 'index'
    index: ->
        alert 'url catched... will fetch the objects'
        books = new App.Collections.Books
        #don't know what the below line does.
        alert "Fetching the objects"
        books.fetch()
        ###
        success: (collection) ->
                editor.log "There are now #{collection.length} books in our collection."

  	        error: (collection, response) ->
                editor.log "Server says #{response.status}."
        ###
        @book_index = new App.Views.BooksIndex collection:books

