# frozen_string_literal: true

require 'test_helper'

class TestAddress < MiniTest::Test
  def setup
    node = load_fixture('orders').xpath('//xmlns:ShippingAddress').to_a.sample
    @address = Address.new(node)
  end

  def test_name
    assert_kind_of String, @address.name
  end

  def test_lines
    assert_kind_of Array, @address.lines
    @address.lines.each do |line|
      assert_kind_of String, line
    end
  end

  def test_city
    assert_kind_of String, @address.city
  end

  def test_state_or_region
    @address.state_or_region
  end

  def test_postal_code
    assert_kind_of String, @address.postal_code
  end

  def test_country_code
    assert_kind_of String, @address.country_code
  end
end
