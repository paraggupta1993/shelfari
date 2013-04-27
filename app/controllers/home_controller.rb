class HomeController < ApplicationController
  
  
  def index
     #This function handles listing of books as well as request for newbooks
     
     if( params.has_key?(:name) && params.has_key?(:author))
      #If new books creation request has come.
      
      #Extract parameters
      @name = params[:name]   
      @author = params[:author]
      @status = false
      @status = false if ( params[:status] == "0" ) 
      @status = true if ( params[:status] == "1")
      
      
      #some checking constraints
      #TODO 

      #put in database
      @book = Book.new( :name=> @name, :author => @author , :status => @status )
      @book.save()
     end

    #Render list of books 
    @books = Book.all 
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @books }
    end
  end

  def destroy
    #this function destroys the model
    Book.destroy(params[:id])
  end 
 
  def update
    #this function updates the model 
      @book = Book.find(params[:id])
      
      @name = params[:name]   
      @author = params[:author]
      @status = false if ( params[:status] == "0" ) 
      @status = true if ( params[:status] == "1")
      @book.update_attributes( name: params[:name], author: params[:author] , status:  @status  )
      redirect_to ({ :action => 'index', :status => 303 , :controller => 'home', :notice => "Success" })
  end
end
