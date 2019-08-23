# frozen_string_literal: true

require 'test_helper'

class TestEntity < MiniTest::Test
  def test_parses_floats
    xml = <<-XML
    <Float xmlns="example">10.0</Float>
    XML
    entity = build_entity(xml)
    float = entity.float_at_xpath('Float')
    assert_equal 10.0, float
  end

  def test_parses_integers
    xml = <<-XML
    <Integer xmlns="example">10</Integer>
    XML
    entity = build_entity(xml)
    integer = entity.integer_at_xpath('Integer')
    assert_equal 10, integer
  end

  def test_parses_money
    xml = <<-XML
    <Price xmlns="example">
      <CurrencyCode>USD</CurrencyCode>
      <Amount>10.00</Amount>
    </Price>
    XML
    entity = build_entity(xml)
    money = entity.money_at_xpath('Price')
    assert_equal 1000, money.fractional
  end

  def test_parses_yen
    xml = <<-XML
    <Price xmlns="example">
      <CurrencyCode>JPY</CurrencyCode>
      <Amount>1000.00</Amount>
    </Price>
    XML
    entity = build_entity(xml)
    money = entity.money_at_xpath('Price')
    assert_equal 1000, money.fractional
  end

  def test_parses_text
    xml = <<-XML
    <Text xmlns="example">Foo</Text>
    XML
    entity = build_entity(xml)
    text = entity.text_at_xpath('Text')
    assert_equal 'Foo', text
  end

  def test_strips_text
    xml = <<-XML
    <Text xmlns="example">Foo

    </Text>
    XML
    entity = build_entity(xml)
    text = entity.text_at_xpath('Text')
    assert_equal 'Foo', text
  end

  def test_parses_time
    xml = <<-XML
    <Time xmlns="example">2013-01-01T01:30:00.000-06:00</Time>
    XML
    entity = build_entity(xml)
    time = entity.time_at_xpath('Time')
    assert_kind_of Time, time
  end

  def test_handles_nil_values
    xml = <<-XML
    <Foo xmlns="example">
    </Foo>
    XML
    entity = build_entity(xml)

    assert_nil entity.float_at_xpath('Bar')
    assert_nil entity.integer_at_xpath('Bar')
    assert_nil entity.money_at_xpath('Bar')
    assert_nil entity.time_at_xpath('Bar')
    assert_nil entity.text_at_xpath('Bar')
  end

  private

  def build_entity(xml)
    Entity.new(Nokogiri(xml))
  end
end
