# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_facebook_blog_tab_session',
  :secret      => 'd0301a12ede4a2ec349d631d35ea97aad2972d49e405242155d9df95928d2e1b7c494b6338612ff21a5b1a276bd6b9f3e9607b7828d419c2adcf7bc82b3f2af9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
