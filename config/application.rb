require_relative 'boot'

require 'rails/all'
require 'csv'
require 'ethiopic_date'
include EthiopicDate

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Matching
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_storage.variant_processor = :vips
    Rails.application.routes.default_url_options[:host] =  "localhost"
  end
end
