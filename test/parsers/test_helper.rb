require_relative '../test_helper'

class ParserTest < MiniTest::Test
  def fixture
    file = File.expand_path('../../fixtures/list_orders.xml', __FILE__)
    body = File.read(file)

    Nokogiri(body)
  end
end
