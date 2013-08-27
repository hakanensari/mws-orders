require_relative 'test_helper'

class ServiceStatusRequestTest < RequestTestHelper
  def mock_response_body
    <<-EOF
      <Response xmlns="ns">
        <GetServiceStatusResult>
          <Status>GREEN</Status>
        </GetServiceStatusResult>
      </Response>
    EOF
  end

  def setup
    @status = Request::ServiceStatus.new(mock_client)
  end

  def test_gets_status
    res = @status.get
    assert_kind_of Parser::ServiceStatus, res
  end
end
