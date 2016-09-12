class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :url
      t.float :price, null: false
      t.text :description, null: false
      t.string :email, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
