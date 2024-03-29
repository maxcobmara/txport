Txport::Application.configure do
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
  config.assets.check_precompiled_asset = false
  config.assets.quiet = true

  #devise config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.after_initialize do
    Bullet.enable = true
    #Bullet.alert = true
    #Bullet.console = true
    Bullet.slack = { webhook_url: 'https://hooks.slack.com/services/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', channel: '#feed', username: 'txport' }
  end

  # FIXME: Change to your development settings
  # @see https://github.com/thoughtbot/paperclip
  # Install ImageMagick & run `which convert` to get the location
  Paperclip.options[:command_path] = "/usr/bin/"


end
