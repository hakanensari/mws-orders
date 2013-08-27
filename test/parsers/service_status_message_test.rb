require_relative 'test_helper'

class ServiceStatusMessageParserTest < ParserTest
  def setup
    node = fixture('service_status').xpath('//xmlns:Message').first
    @message = Parser::ServiceStatusMessage.new(node)
  end

  def test_locale
    assert_kind_of String, @message.locale
  end

  def test_text
    assert_kind_of String, @message.text
  end
end
