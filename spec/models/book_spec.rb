require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  describe 'parsing' do
    before(:each) do 
      @book = Book.make
    end   
    it 'should find the file' do
      @book.file.class.should == File
    end  
  end  
end
