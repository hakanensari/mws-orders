module MWS
  module Orders
    module Parser
      class Base
        attr :document

        def initialize(document)
          @document = document
        end
      end
    end
  end
end
