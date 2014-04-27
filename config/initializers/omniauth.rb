OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
	provider :twitter, ENV['TWITTER_APP_ID'], ENV['TWITTER_SECRET']
	provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
	provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_SECRET']
end
