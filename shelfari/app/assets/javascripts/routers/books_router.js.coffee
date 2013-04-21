class App.Routers.Books extends Backbone.Router
    routes: 
        'index' : 'index'
        ''      : 'index'
    index: ->
        books = new App.Collections.Books
        books.fetch()
