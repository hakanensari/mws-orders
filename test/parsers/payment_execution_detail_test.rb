require_relative 'test_helper'

class PaymentExecutionDetailParserTest < ParserTest
  def setup
    node = fixture.xpath('//xmlns:PaymentExecutionDetail').first
    @ped = Parser::PaymentExecutionDetail.new(node)
  end

  def test_has_payment_execution_detail_items
    refute_empty @ped.to_a
    @ped.each { |pedi| assert_kind_of Parser::PaymentExecutionDetailItem, pedi }
  end
end
