class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :user_id
      t.string :author
      t.string :publisher
      t.integer :price
      t.datetime :publish_date
      t.text :caption
      t.string :image

      t.timestamps null: false
    end
  end
end
