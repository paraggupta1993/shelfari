class HomeController < ApplicationController
  def index
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
