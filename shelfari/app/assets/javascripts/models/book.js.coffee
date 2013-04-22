class App.Models.Book extends Backbone.Model
    #id : ''
    name : ''
    author : ''
    status : '' 
    
    initialize: () ->
        #alert "new model initialized"
    
    defaults: ->
    #This property just sets default values for the model in case we need to.
      #id :  nil
