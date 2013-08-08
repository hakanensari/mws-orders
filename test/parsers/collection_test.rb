require_relative 'test_helper'

class CollectionParserTest < ParserTest
  def test_is_enumerable
    assert_respond_to Parser::Collection.new(nil), :map
  end
end
