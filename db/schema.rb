# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090503170124) do

  create_table "books", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "summary"
    t.string   "book_file_name"
    t.string   "book_content_type"
    t.integer  "book_file_size"
    t.datetime "book_updated_at"
    t.string   "art_file_name"
    t.string   "art_content_type"
    t.integer  "art_file_size"
    t.datetime "art_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer "book_it"
    t.integer "number"
    t.text    "body"
    t.text    "body_html"
  end

end
