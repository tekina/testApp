SimpleTokenAuthentication.configure do |config|
	# refer to https://github.com/gonzalo-bulnes/simple_token_authentication for more options

	# if false, userse must provide their email and auth_token for every request
	config.sign_in_token = false
end