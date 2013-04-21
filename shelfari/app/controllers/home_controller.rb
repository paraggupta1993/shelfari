class HomeController < ApplicationController
  def index
=begin
     if( params.has_key?(:name) && params.has_key?(:author) && params.has_key?(:status))
      #If new books creation request has come.
      
      #Extract parameters
      @name = params[:name]   
      @author = params[:author]
      @status = params[:status]
      
      #some checking constraints
       
      #put in database
      @book = Book.new( @name, @author , @status )
      if @book.save 
      else 
      end
     end
=end 
    @books = Book.all 
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @books }
    end
  end

  def new_book
  end 
  
  def add_book
  end 
  
  def edit_book
  end

end
