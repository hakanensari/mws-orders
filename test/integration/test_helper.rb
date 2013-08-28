require_relative '../test_helper'
require 'yaml'

class IntegrationTest < MiniTest::Test
  def accounts
    YAML.load_file(File.expand_path('../../fixtures/mws.yml', __FILE__))
  end

  def setup
    @clients = accounts.map { |mws| Client.new(*mws.values) }
  end
end
