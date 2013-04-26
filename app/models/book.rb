class Book < ActiveRecord::Base
    attr_accessible :id , :name, :author, :status
end
