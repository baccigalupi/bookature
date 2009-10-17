ActionController::Routing::Routes.draw do |map|
  map.resources :books do |book|
    book.resources :pages
  end
  
  map.with_options :controller => 'clearance/sessions'  do |m|
    m.login  '/login',  :action => 'new'
    m.logout '/logout', :action => 'destroy'
  end  
  
  map.root :controller => "books", :action => 'index'

  
end
