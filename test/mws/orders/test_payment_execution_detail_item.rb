# frozen_string_literal: true

require 'test_helper'

class TestPaymentExecutionDetailItem < MiniTest::Test
  def setup
    node = load_fixture('orders').at_xpath('//xmlns:PaymentExecutionDetailItem')
    @item = PaymentExecutionDetailItem.new(node)
  end

  def test_payment
    assert_kind_of Money, @item.payment
  end

  def test_payment_method
    assert_kind_of String, @item.payment_method
  end
end
