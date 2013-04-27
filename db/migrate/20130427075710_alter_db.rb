class AlterDb < ActiveRecord::Migration
  def up
    add_column :name, :string
    add_column :author, :string
    add_column :status, :boolean
    
  end

  def down
  end
end
