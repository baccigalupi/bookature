# Shamification
Sham.define do 
  username { Faker::Internet.user_name } 
  email { Faker::Internet.email }
  password { Faker::Name.name.gsub(' ', '') } 
  token_expires_at { rand(13).days.from_now.to_s(:db) } 
  token { Digest::SHA1.hexdigest([Time.now, (1..10).map{ rand.to_s }].flatten.join('--')) }
  title { Faker::Lorem.words(5) } 
end  
  
# Model Blueprints
User.blueprint do
  login                     { Sham.username }
  email                     { Sham.email }
  password                  { Sham.password }
  password_confirmation     { password } 
  remember_token_expires_at { Sham.remember_token_expires_at }
  remember_token            { Sham.remember_token }
end 

Book.blueprint do
  id                  { 1 }
  title               { Sham.title }
  # always grab the checked in book for id #1
  book_file_name      { 'Small_Fish.txt' }
  book_content_type   { 'text/plain' }
  book_file_size      { 858773 }
end   
          