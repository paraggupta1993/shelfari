class HomeController < ApplicationController
  def index
     if( params.has_key?(:name) && params.has_key?(:author) && params.has_key?(:status))
      #If new books creation request has come.
      
      #Extract parameters
      @name = params[:name]   
      @author = params[:author]
      @status = false if ( params[:status] == "0" ) 
      @status = true if ( params[:status] == "1")
      
      #some checking constraints
      #put in database
      @book = Book.new( :name=> @name, :author => @author , :status => @status )
      @book.save()
     end

    @books = Book.all 
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @books }
    end
  end

  def new_book
    #for testing purpose
    @book = Book.new( :name => 'new_book', :author => 'parag', :status => false  )
    @book.save()
  end 
  
  def add_book
  end 
  
  def edit_book
  end

end
