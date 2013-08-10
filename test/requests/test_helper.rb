require_relative '../test_helper'

class RequestTest < MiniTest::Test
  def client
    mws = YAML.read_file(File.expand_path('../../fixtures/mws.xml', __FILE__))
    MWS::Orders::Client.new(*mws.values)
  end
end
