class Book < ActiveRecord::Base 
  # ATTACHMENTS ====================
  has_attached_file :art, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :book # text file
  
  # RELATIONSHIPS ==================
  has_one :author, :class_name => "User", :foreign_key => 'user_id'
  has_many :pages
  
  # BOOK PARSING ===================
  def file 
    @file ||= File.new( book_path )
  end 
  
  def book_path 
    "#{RAILS_ROOT}#{book.url}"
  end   
  
end
