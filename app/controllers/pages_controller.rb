class PagesController < ApplicationController
  def index 
    redirect_to "/books/#{params[:book_id]}/pages/#{params[:id]}"
  end  
  
  def show 
    @book = Book.find(params[:book_id])
    @page1 = Page.first(:conditions => {:book_id => @book.id, :number => params[:id] })
    @page1 ||= @book.pages.first
    @page2 = Page.first(:conditions => {:book_id => @book.id, :number => @page1.number+1 }) 
  end  
end
