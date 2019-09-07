# frozen_string_literal: true

require 'test_helper'

class TestTaxClassification < MiniTest::Test
  def setup
    node = load_fixture('orders').at_xpath('//xmlns:TaxClassification')
    @tax_classification = TaxClassification.new(node)
  end

  def test_name
    assert_kind_of String, @tax_classification.name
  end

  def test_value
    assert_kind_of String, @tax_classification.value
  end
end
