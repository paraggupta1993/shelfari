class HomeController < ApplicationController
  def index
     
     if( params.has_key?(:name) && params.has_key?(:author))
      #If new books creation request has come.
      
      #Extract parameters
      @name = params[:name]   
      @author = params[:author]
      @status = false
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
  
  
  def destroy
    #@book = Book.new( :name => 'destroy_book', :author => 'parag', :status => false  )
    #@book.save()
    Book.destroy(params[:id])
  end 
 
  def add_book
  end 
  
  def update
    #@book = Book.new( :name => 'update_book', :author => 'parag', :status => false  )
    #@book.save()
    #for testing purpose
      @book = Book.find(params[:id])
      
      @name = params[:name]   
      @author = params[:author]
      @status = false if ( params[:status] == "0" ) 
      @status = true if ( params[:status] == "1")
      @book.update_attributes( name: params[:name], author: params[:author] , status:  @status  )
      #@book.save()
      redirect_to ({ :action => 'index', :status => 303 , :controller => 'home', :notice => "Success" })
  end
end
