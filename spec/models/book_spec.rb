require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  describe 'parsing' do
    before(:each) do 
      @book = Book.make
    end   
    
    it 'should find the file' do
      @book.file.class.should == File
    end
    
    it 'should initially buffer a set of 32 lines from the file' do
      @book.fill_buffer
      @book.buffer.size.should == 32
    end  
    
    it 'should add additional lines to the buffer to reach 32 lines in subsequent iterations' do 
      @book.fill_buffer
      @book.buffer.shift
      @book.buffer.size.should == 31
      @book.fill_buffer
      @book.buffer.size.should == 32
    end
    
    it 'parse a page into an array of strings that are paragraphs' do
      @book.fill_buffer
      #puts @book.parse_page
      puts @book.buffer[0]
    end  
        
  end  
end
