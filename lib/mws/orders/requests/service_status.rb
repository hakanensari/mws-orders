module MWS
  module Orders
    module Request
      class ServiceStatus < Base
        def get
          parameters(:get_service_status)
          execute
        end
      end
    end
  end
end
