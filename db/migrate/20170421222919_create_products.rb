class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :image
      t.integer :category_id
      
      t.timestamps null: false
    end
  end
end
