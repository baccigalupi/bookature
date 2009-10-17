class Page < ActiveRecord::Base 
  def self.create_from_array( arr, number, book_id )
    encoded = arr.map do |line|
      line.gsub!(/\[.*{3}\]/, '') # These are weird word comments example [CJ1]
      cleaned = HTMLEntities.new( 'expanded' ).encode( line, :named ).strip
      cleaned.blank? ? "&nbsp;" : cleaned 
    end
    create( :body => "<p>#{encoded.join("</p>\n<p>")}</p>", :number => number, :book_id => book_id )  
  end  
end
