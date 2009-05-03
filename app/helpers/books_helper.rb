module BooksHelper 
  def book_art(book, size=:thumb) 
    if book.art_file_name.blank? 
      "<h1>#{book.title}</h1><h2>by</h2><h1>Lawrence James</h1>"
    else
      image_tag( book.art.url( size ) )
    end     
  end  
end
