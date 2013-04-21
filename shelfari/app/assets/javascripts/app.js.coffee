window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    alert 'Hello from Backbone!'
    new App.Routers.Books
    Backbone.history.start() 

$(document).ready ->
  App.initialize()
