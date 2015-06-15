Elog::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  config.assets.compile = true

	ENV['FACEBOOK_APP_ID'] = '273641516138791'
	ENV['FACEBOOK_SECRET'] = '1b31c9298bf357ae2c1a760b3633132d'
	ENV['GOOGLE_APP_ID'] = '726927775771-d1mc11da3g5b2ljqfaequv5430taaocl.apps.googleusercontent.com'
	ENV['GOOGLE_SECRET'] = '00m3rtVyd5dDaIOYWpm3wkla'
	ENV['TWITTER_APP_ID'] = 'h8X5VHjt7MBldoQV98MCGA'
	ENV['TWITTER_SECRET'] = 'gln3odZ9iLe0feK6D884uFaIk3wxROAamBSB5V6kE'
	ENV['ADAPTER'] = 'sqlite3'

end
