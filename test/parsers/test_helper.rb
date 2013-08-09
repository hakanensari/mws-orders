require_relative '../test_helper'

class ParserTest < MiniTest::Test
  def fixture(type)
    file = File.expand_path("../../fixtures/list_#{type}.xml", __FILE__)
    body = File.read(file)

    Nokogiri(body)
  end
end
