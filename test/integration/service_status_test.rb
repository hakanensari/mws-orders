require_relative 'test_helper'

class ServiceStatusTest < IntegrationTest
  def test_gets_service_status
    @clients.each do |client|
      assert client.get_service_status
    end
  end
end
