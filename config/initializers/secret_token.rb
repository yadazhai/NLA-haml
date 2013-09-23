# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
NLADb::Application.config.secret_key_base = '36f3857ea3e9f1febb857253871437b7f858e1db392ade26fea8f32b53916da014e512052f4191439b9aeab72a18b654021b5f2a029e9cb867ed4c66a97b228b'
