class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :owner_id
      t.string  :title
      t.text :summary
      t.string :author_name
      
      t.string  :book_file_name
      t.string  :book_content_type
      t.integer :book_file_size
      t.datetime :book_updated_at
      
      t.string  :art_file_name
      t.string  :art_content_type
      t.integer :art_file_size
      t.datetime :art_updated_at 
      
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
