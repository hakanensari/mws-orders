module MWS
  module Orders
    module Parser
      class Base
        attr :document

        def self.inherited(subclass)
          subclass.send(:include, Structure)
        end

        def initialize(document)
          @document = document
        end

        private

        def at_xpath(path)
          document.at_xpath(with_namespace(path))
        end

        def xpath(path)
          document.xpath(with_namespace(path))
        end

        def with_namespace(path)
          path.split('/').map { |attr| "xmlns:#{attr}" }.join('/')
        end
      end
    end
  end
end
