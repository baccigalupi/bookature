# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_reader_session',
  :secret      => '7bafb6dad41d0cc099f1fde519ce07f9e0fcd140c88ba8f6bb64af219004c03bb077a313c07854d050433707495d2599cd83cc62e7db5cbbbd53743a32e0454d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
