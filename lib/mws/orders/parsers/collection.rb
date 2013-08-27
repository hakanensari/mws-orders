module MWS
  module Orders
    module Parser
      class Collection < Base
        include Enumerable

        def each
          raise NotImplementedError
        end

        def empty?
          count == 0
        end

        def inspect
          "#{self.class.name.split('::').last}: #{self.count}"
        end
        alias :to_s :inspect
      end
    end
  end
end
