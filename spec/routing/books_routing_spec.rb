require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "books", :action => "index").should == "/books"
    end
  
    it "maps #new" do
      route_for(:controller => "books", :action => "new").should == "/books/new"
    end
  
    it "maps #show" do
      route_for(:controller => "books", :action => "show", :id => "1").should == "/books/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "books", :action => "edit", :id => "1").should == "/books/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "books", :action => "create").should == {:path => "/books", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "books", :action => "update", :id => "1").should == {:path =>"/books/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "books", :action => "destroy", :id => "1").should == {:path =>"/books/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/books").should == {:controller => "books", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/books/new").should == {:controller => "books", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/books").should == {:controller => "books", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/books/1").should == {:controller => "books", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/books/1/edit").should == {:controller => "books", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/books/1").should == {:controller => "books", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/books/1").should == {:controller => "books", :action => "destroy", :id => "1"}
    end
  end
end
