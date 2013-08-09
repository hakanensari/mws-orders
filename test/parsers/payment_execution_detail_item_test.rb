require_relative 'test_helper'

class PaymentExecutionDetailItemParserTest < ParserTest
  def setup
    node = fixture('orders').xpath('//xmlns:PaymentExecutionDetailItem').first
    @pedi = Parser::PaymentExecutionDetailItem.new(node)
  end

  def test_payment
    assert_kind_of Money, @pedi.payment
  end

  def test_payment_method
    assert_kind_of String, @pedi.payment_method
  end
end
