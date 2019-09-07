# frozen_string_literal: true

require 'test_helper'

class TestTaxCollection < MiniTest::Test
  def setup
    node = load_fixture('order_items').at_xpath('//xmlns:TaxCollection')
    @tax_collection = TaxCollection.new(node)
  end

  def test_model
    assert_kind_of String, @tax_collection.model
  end

  def test_responsible_party
    assert_kind_of String, @tax_collection.responsible_party
  end
end
