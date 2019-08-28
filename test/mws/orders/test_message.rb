# frozen_string_literal: true

require 'test_helper'

class TestMessage < MiniTest::Test
  def setup
    node = load_fixture('service_status').xpath('//xmlns:Message').first
    @message = Message.new(node)
  end

  def test_locale
    assert_kind_of String, @message.locale
  end

  def test_text
    assert_kind_of String, @message.text
  end
end
