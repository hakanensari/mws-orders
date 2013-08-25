require_relative '../test_helper'

class RequestTestHelper < Minitest::Test
  def mock_response_body
    raise NotImplementedError
  end

  def mock_response
    res = Minitest::Mock.new
    res.expect(:body, mock_response_body)
  end

  def mock_client
    client = Minitest::Mock.new
    client.expect(:home_marketplace_id, '123')
    client.expect(:post, mock_response, [Hash])
  end
end
