class App.Collections.Books extends Backbone.Collection
  #This property tells our collection what kind of objects it can have.
  model: App.Models.Book
  
  #This property tells the collection where to go when when we execute the fetch method of the collection.
  url : '/home/index'

  initialize : ->
    alert "Pokemon !"
