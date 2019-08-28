# frozen_string_literal: true

require 'test_helper'

class TestPaymentExecutionDetailItem < MiniTest::Test
  def setup
    node =
      load_fixture('orders').xpath('//xmlns:PaymentExecutionDetailItem').first
    @pedi = PaymentExecutionDetailItem.new(node)
  end

  def test_payment
    assert_kind_of Money, @pedi.payment
  end

  def test_payment_method
    assert_kind_of String, @pedi.payment_method
  end
end
