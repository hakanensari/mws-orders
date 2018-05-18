# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'mws/orders/version'

Gem::Specification.new do |gem|
  gem.name        = 'mws-orders'
  gem.version     = MWS::Orders::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Hakan Ensari']
  gem.email       = ['hakanensari@gmail.com']
  gem.homepage    = 'https://github.com/hakanensari/mws-orders'
  gem.summary     = 'Wraps the Amazon MWS Orders API'
  gem.description = 'A rich Ruby interface to the Amazon MWS Orders API'
  gem.license     = 'MIT'

  gem.files         = Dir.glob('lib/**/*') + %w[LICENSE README.md]
  gem.test_files    = Dir.glob('test/**/*')
  gem.require_paths = ['lib']

  gem.add_dependency 'money', '~> 6.0'
  gem.add_dependency 'nokogiri', '~> 1.5'
  gem.add_dependency 'peddler', '~> 2.0'
  gem.add_dependency 'structure', '~> 1.0'
  gem.required_ruby_version = '>= 2.3'
end
