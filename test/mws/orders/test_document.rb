# frozen_string_literal: true

require 'test_helper'

class TestEntity < MiniTest::Test
  def setup
    xml = <<-XML
      <Product xmlns="foo" xmlns:ns2="bar">
        <ASIN>1933988665</ASIN>
        <ns2:Title>Baz</ns2:Title>
      </Product>
    XML
    @document = Document.new(Nokogiri(xml))
  end

  def test_xpath
    nodeset = @document.xpath('Product/ASIN')
    refute_empty nodeset
    assert_kind_of Nokogiri::XML::NodeSet, nodeset
  end

  def test_at_xpath
    assert @document.at_xpath('Product/ASIN')
  end

  def test_multiple_namespaces
    refute @document.at_xpath('Product/Title')
    assert @document.at_xpath('Product/ns2:Title')
  end
end
