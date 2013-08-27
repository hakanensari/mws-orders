module MWS
  module Orders
    module Request
      class Base
        attr :client
        attr_accessor :last_response

        def initialize(client)
          @client = client
        end

        def next_token
          node = document.at_xpath('//xmlns:NextToken')
          node.text if node
        end

        private

        def execute
          fetch
          parse
        end

        def fetch
          @last_response = client.post(query: parameters)
        end

        def parameters(action = nil)
          @parameters = Helper::Parameters.new(action) if action
          @parameters
        end

        def parse
          parser.new(node)
        end

        def parser
          Parser.const_get(name)
        end

        def node
          document.xpath("//xmlns:#{name}")
        end

        def document
          Nokogiri::XML(last_response.body)
        end

        def name
          self.class.name.split('::').last
        end
      end
    end
  end
end
