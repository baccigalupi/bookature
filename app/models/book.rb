class Book < ActiveRecord::Base 
  attr_accessor :buffer, :current_page
  
  # ATTACHMENTS ====================
  has_attached_file :art, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :book # text file
  
  # RELATIONSHIPS ==================
  has_one :owner, :class_name => "User", :foreign_key => 'owner_id'
  has_many :pages, :dependent => :destroy
  
  # BOOK PARSING =================== 
  after_save :parse
  
  def parse
    pages.destroy_all 
    self.current_page = 1
    while( fill_buffer.last != nil) do
      Page.create_from_array( parse_page, current_page, id )
      self.current_page += 1
    end
    Page.create_from_array( parse_page, current_page, id )
  end  
  
  # pl_ratio is the css space ratio for a paragraph versus a line. 
  # Since this page demarkation is all about formatting, the extra 
  # padding/margin on the paragraph will make all the difference in
  # the world. The default assumes a normal line-height of 18 pixels,
  # with total padding/margin top and bottom to be 18px (9px top/bottom) 
  # 
  # returns page, an array of strings  
  def parse_page( pl_ratio = 36.0/18.0 )
    
    # initializations
    lines = 0
    page = []
    eof = false
    
    # looping through buffer until page is full
    while (lines_per_page - lines) > 0 && !eof
      buffer_line = self.buffer.shift 
      if buffer_line.nil? # EOF reached, stop while loop 
        eof = true
      else # add content to page until full 
        word_count = buffer_line.split.size
        number_lines = (word_count/words_per_line).round
        number_lines = number_lines - 1 + pl_ratio # account for paragraph padding
        
        if (lines + number_lines) <= lines_per_page
          # add the whole buffer_line to the page
          lines += number_lines
          page << buffer_line
        else
          # add only part of the buffer_line to the page
          # unshift the rest back into the buffer 
          remainder = lines_per_page - lines - 1 # addition line is for rounding and pl_ration adjustment
          remainder = (remainder * words_per_line).to_i
          from_beginning = word_count - remainder 
          if from_beginning > 0
            keeper = buffer_line.match(/^([\w|'|"]*\W?){#{from_beginning}}/).to_s # first X number of words
            page << keeper
            remainder = buffer_line.sub( keeper, '' )
            self.buffer.unshift( remainder ) # add remainder to the buffer  
          end  
          lines = lines_per_page # satisfy conditions for end of page
        end    
      end  
    end 
    page 
  end  
  
  
  def fill_buffer
    self.buffer ||= []
    (lines_per_page - buffer.size).to_i.times do |number|
      self.buffer << file.gets("\r") # should fill with nil when EOF reached
    end
    buffer  
  end  
  
  def file 
    @file ||= File.new( book_path, 'r' )
  end 
  
  private
    def book_path 
      "#{RAILS_ROOT}/public#{url}"
    end
    
    def url
      book.url.match(/([^?]*)/).captures.first
    end  
    
    def words_per_line 
      13.5
    end
    
    def lines_per_page
      32.0
    end      
  public
  
  def total_pages
    @total_pages ||= pages.count
  end     
  
end
