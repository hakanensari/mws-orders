require "test_helper"

class TestEntity < MiniTest::Test
  def test_parses_floats
    xml = <<-EOF
    <Float xmlns="example">10.0</Float>
    EOF
    entity= build_entity(xml)
    float = entity.float_at_xpath("Float")
    assert_equal 10.0, float
  end

  def test_parses_integers
    xml = <<-EOF
    <Integer xmlns="example">10</Integer>
    EOF
    entity= build_entity(xml)
    integer = entity.integer_at_xpath("Integer")
    assert_equal 10, integer
  end

  def test_parses_money
    xml = <<-EOF
    <Price xmlns="example">
      <CurrencyCode>USD</CurrencyCode>
      <Amount>10.00</Amount>
    </Price>
    EOF
    entity= build_entity(xml)
    money = entity.money_at_xpath("Price")
    assert_equal "$10.00", money.format
  end

  def test_parses_japanese_yen
    xml = <<-EOF
    <Price xmlns="example">
      <CurrencyCode>JPY</CurrencyCode>
      <Amount>1000.00</Amount>
    </Price>
    EOF
    entity= build_entity(xml)
    money = entity.money_at_xpath("Price")
    assert_equal "¥1,000", money.format
  end

  def test_parses_text
    xml = <<-EOF
    <Text xmlns="example">Foo</Text>
    EOF
    entity= build_entity(xml)
    text = entity.text_at_xpath("Text")
    assert_equal "Foo", text
  end

  def test_strips_text
    xml = <<-EOF
    <Text xmlns="example">Foo

    </Text>
    EOF
    entity= build_entity(xml)
    text = entity.text_at_xpath("Text")
    assert_equal "Foo", text
  end

  def test_parses_time
    xml = <<-EOF
    <Time xmlns="example">2013-01-01T01:30:00.000-06:00</Time>
    EOF
    entity= build_entity(xml)
    time = entity.time_at_xpath("Time")
    assert_kind_of Time, time
  end

  def test_handles_nil_values
    xml = <<-EOF
    <Foo xmlns="example">
    </Foo>
    EOF
    entity= build_entity(xml)

    assert_nil entity.float_at_xpath("Bar")
    assert_nil entity.integer_at_xpath("Bar")
    assert_nil entity.money_at_xpath("Bar")
    assert_nil entity.time_at_xpath("Bar")
    assert_nil entity.text_at_xpath("Bar")
  end

  private

  def build_entity(xml)
    Entity.new(Nokogiri(xml))
  end
end
