# frozen_string_literal: true

require 'test_helper'

class TestBuyerTaxInfo < MiniTest::Test
  def setup
    node = load_fixture('orders').at_xpath('//xmlns:BuyerTaxInfo')
    @info = BuyerTaxInfo.new(node)
  end

  def test_company_legal_name
    assert_kind_of String, @info.company_legal_name
  end

  def test_taxing_region
    assert_kind_of String, @info.taxing_region
  end

  def test_tax_classifications
    refute_empty @info.tax_classifications
    @info.tax_classifications.each do |tax_classification|
      assert_kind_of TaxClassification, tax_classification
    end
  end
end
