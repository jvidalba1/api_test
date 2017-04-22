class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :en
      t.string :es

      t.timestamps null: false
    end
  end
end
