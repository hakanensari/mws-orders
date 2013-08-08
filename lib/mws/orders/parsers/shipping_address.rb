module MWS
  module Orders
    module Parser
      class ShippingAddress < Model
        def name
          text_at_xpath('Name')
        end

        def address_lines
          1.upto(3).map { |i| at_xpath("AddressLine#{i}") }.compact.map(&:text)
        end

        def city
          text_at_xpath('City')
        end

        def state_or_region
          text_at_xpath('StateOrRegion')
        end

        def postal_code
          text_at_xpath('PostalCode')
        end

        def country
          text_at_xpath('Country')
        end
      end
    end
  end
end
