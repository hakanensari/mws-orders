# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'mws/orders/version'

Gem::Specification.new do |gem|
  gem.name        = 'mws-orders'
  gem.version     = MWS::Orders::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Hakan Ensari']
  gem.email       = ['me@hakanensari.com']
  gem.homepage    = 'https://github.com/hakanensari/mws-orders'
  gem.summary     = <<-SUMMARY
    A Ruby interface to the Amazon MWS Orders API, built on Peddler
  SUMMARY
  gem.license     = 'MIT'
  gem.files       = Dir.glob('lib/**/*') + %w[LICENSE README.md]

  gem.add_runtime_dependency 'money', '~> 6.0'
  gem.add_runtime_dependency 'nokogiri', '~> 1.0'
  gem.add_runtime_dependency 'peddler', '~> 2.0'
  gem.add_runtime_dependency 'structure', '~> 2.0'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rubocop'

  gem.required_ruby_version = '>= 2.5'
end
