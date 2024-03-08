require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NotesApi
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_lib(ignore: %w(assets tasks))

    config.time_zone = 'Brasilia'

    I18n.available_locales = %i[pt-BR en]
    config.i18n.default_locale = :'pt-BR'

    config.eager_load_paths << Rails.root.join('lib/clients')

    config.api_only = true
  end
end
