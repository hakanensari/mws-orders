module MWS
  module Orders
    module Request
      class ServiceStatus < Base
        def get
          parameters(:get_service_status)
          execute
        end

        private

        def node
          document.xpath("//xmlns:GetServiceStatusResult")
        end
      end
    end
  end
end
