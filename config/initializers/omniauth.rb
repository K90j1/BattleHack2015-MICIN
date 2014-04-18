OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '273641516138791', '1b31c9298bf357ae2c1a760b3633132d'
end