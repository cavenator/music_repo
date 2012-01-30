# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_DadsProject_session',
  :secret      => '00fb7cd080743cf2dc983d6c26e85e019674d0620a2e641d374d8d11112c3d6fb3c35accc362a80855fd783a9a298d346e0b903b01f44d86979d8b76f9c9a811'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
