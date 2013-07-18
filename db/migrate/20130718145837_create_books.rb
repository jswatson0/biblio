class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :published
      t.string :catagory
      t.text :description
      t.integer :rating
      t.string :isbn
      t.string :cover


      t.timestamps
    end
  end
end
