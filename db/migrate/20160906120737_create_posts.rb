class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :scope
      t.references :user 
      
      t.timestamps null: false
    end
  end
end
