class AlterDb < ActiveRecord::Migration
  def up
    add_column :books, :name, :string
    add_column :books, :author, :string
    add_column :books , :status, :boolean
    
  end

  def down
  end
end
