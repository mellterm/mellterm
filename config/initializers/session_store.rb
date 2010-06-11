# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mellterm_session',
  :secret      => '9cb6f7aaeaad01e51736a6fe96a24c6da0738ccb9810e639b7216c3495a937dfc59ba10b5460f0a252496689181c78bbe0e8097dc0ccbafef4f897df5b17992d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
