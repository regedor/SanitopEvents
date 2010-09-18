# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SanitopEvents_session',
  :secret      => 'd876242fbf366a8905547fe115988dec28270353e9b5bbab8933b49dee0eb42b6684dc75b88e2fa9dc60fa1222461aa41726fe57328f91a6078c8cc76f57e828'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
