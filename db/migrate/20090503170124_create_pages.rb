class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :book_it
      t.integer :number
      t.text :body
      t.text :body_html
    end
  end

  def self.down
    drop_table :pages
  end
end
