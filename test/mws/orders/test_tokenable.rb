require 'test_helper'

class TestTokenable < MiniTest::Test
  def test_parses_next_token
    xml = <<-EOF
    <NextToken xmlns="example">123</NextToken>
    EOF
    tokenable = build_tokenable(xml)

    assert_equal '123', tokenable.next_token
  end

  def test_returns_nil_if_next_token_is_not_present
    xml = <<-EOF
    <Foo xmlns="example"/>
    EOF
    tokenable = build_tokenable(xml)

    refute tokenable.next_token
  end

  private

  def build_tokenable(xml)
    klass = Class.new(Collection) do
      include Tokenable
    end

    klass.new(Nokogiri(xml))
  end
end
