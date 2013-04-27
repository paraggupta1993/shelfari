class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :name  
      t.text :author 
      t.boolean :status
      t.timestamps
    end
  end
end
