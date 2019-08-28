# frozen_string_literal: true

require 'test_helper'

class TestServiceStatus < MiniTest::Test
  def setup
    node =
      load_fixture('service_status').xpath('//xmlns:GetServiceStatusResult')
                                    .first
    @status = ServiceStatus.new(node)
  end

  def test_status
    assert_kind_of String, @status.status
  end

  def test_timestamp
    assert_kind_of Time, @status.timestamp
  end

  def test_message_id
    assert_kind_of String, @status.message_id
  end

  def test_messages
    assert_kind_of Array, @status.messages
  end
end
