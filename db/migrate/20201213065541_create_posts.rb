class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :text
      t.integer :category_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
