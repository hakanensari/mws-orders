# frozen_string_literal: true

require 'test_helper'

class TestPaymentExecutionDetail < MiniTest::Test
  def setup
    node =
      load_fixture('orders').xpath('//xmlns:PaymentExecutionDetail')
                            .first
    @ped = PaymentExecutionDetail.new(node)
  end

  def test_has_payment_execution_detail_items
    refute_empty @ped.to_a
    @ped.each do |pedi|
      assert_kind_of PaymentExecutionDetailItem, pedi
    end
  end
end
