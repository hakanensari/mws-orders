# frozen_string_literal: true

require 'test_helper'

class TestEntity < MiniTest::Test
  def test_parses_booleans
    xml = <<-XML
    <Boolean xmlns="example">true</Boolean>
    XML
    boolean = build_entity(xml).boolean('Boolean')
    assert_equal true, boolean
  end

  def test_parses_entities
    klass = Class.new(Entity)
    xml = <<-XML
    <Type xmlns="example"><Class xmlns="example">Foo</Class><Class xmlns="example">Bar</Class></Type>
    XML
    entities = build_entity(xml).entities('Type', klass)
    refute_empty entities
    entities.each do |entity|
      assert_kind_of klass, entity
    end
  end

  def test_parses_entity
    klass = Class.new(Entity)
    xml = <<-XML
    <Type xmlns="example"><Class xmlns="example">Foo</Class></Type>
    XML
    entity = build_entity(xml).entity('Type', klass)
    assert_kind_of klass, entity
  end

  def test_parses_floats
    xml = <<-XML
    <Float xmlns="example">10.0</Float>
    XML
    float = build_entity(xml).float('Float')
    assert_equal 10.0, float
  end

  def test_parses_integers
    xml = <<-XML
    <Integer xmlns="example">10</Integer>
    XML
    integer = build_entity(xml).integer('Integer')
    assert_equal 10, integer
  end

  def test_parses_money
    xml = <<-XML
    <Price xmlns="example">
      <CurrencyCode>USD</CurrencyCode>
      <Amount>10.00</Amount>
    </Price>
    XML
    money = build_entity(xml).money('Price')
    assert_equal 1000, money.fractional
  end

  def test_parses_yen
    xml = <<-XML
    <Price xmlns="example">
      <CurrencyCode>JPY</CurrencyCode>
      <Amount>1000.00</Amount>
    </Price>
    XML
    money = build_entity(xml).money('Price')
    assert_equal 1000, money.fractional
  end

  def test_parses_string
    xml = <<-XML
    <String xmlns="example">Foo</String>
    XML
    string = build_entity(xml).string('String')
    assert_equal 'Foo', string
  end

  def test_strips_string
    xml = <<-XML
    <String xmlns="example">Foo

    </String>
    XML
    string = build_entity(xml).string('String')
    assert_equal 'Foo', string
  end

  def test_parses_time
    xml = <<-XML
    <Time xmlns="example">2013-01-01T01:30:00.000-06:00</Time>
    XML
    time = build_entity(xml).time('Time')
    assert_kind_of Time, time
  end

  def test_handles_nil_values
    xml = <<-XML
    <Foo xmlns="example">
    </Foo>
    XML
    entity = build_entity(xml)

    assert_nil entity.float('Bar')
    assert_nil entity.integer('Bar')
    assert_nil entity.money('Bar')
    assert_nil entity.time('Bar')
    assert_nil entity.string('Bar')
  end

  private

  def build_entity(xml)
    Entity.new(Nokogiri(xml))
  end
end
