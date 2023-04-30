require_relative "boot"

require "rails/all"




# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocialMediaApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.use ActionDispatch::Session::CookieStore
  


    config.session_store :cookie_store, key: '_social_media_app_session'


  
    config.api_only = true
  end
end
