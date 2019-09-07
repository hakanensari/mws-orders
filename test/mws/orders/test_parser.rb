# frozen_string_literal: true

require 'test_helper'

class TestParser < MiniTest::Test
  def test_overrides_peddlers_parser
    assert_equal Parser, Client.parser
  end

  def test_response
    parser = Parser.new('response', nil)
    assert parser.response
  end
end
