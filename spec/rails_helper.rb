# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

# Evita la truncación de la base de datos si el entorno es producción
abort("El entorno de Rails se está ejecutando en modo producción!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'

# Configuración de RSpec
RSpec.configure do |config|
  # Directorio de fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Uso de transacciones
  config.use_transactional_fixtures = true

  # Inferir el tipo de especificación de acuerdo a la ubicación del archivo
  config.infer_spec_type_from_file_location!

  # Filtra la traza de errores para no mostrar las rutas de Rails
  config.filter_rails_from_backtrace!

  # Otras configuraciones opcionales
  config.include Capybara::DSL  # Incluye las funciones de Capybara
end
