require "mws/orders/entity"

module MWS
  module Orders
    class ShippingAddress < Entity
      attribute(:name) do
        text_at_xpath("Name")
      end

      attribute(:address_lines) do
        1.upto(3).map { |i| text_at_xpath("AddressLine#{i}") }.compact
      end

      attribute(:city) do
        text_at_xpath("City")
      end

      attribute(:state_or_region) do
        text_at_xpath("StateOrRegion")
      end

      attribute(:postal_code) do
        text_at_xpath("PostalCode")
      end

      attribute(:country_code) do
        text_at_xpath("CountryCode")
      end

      attribute(:phone) do
        text_at_xpath("Phone")
      end
    end
  end
end
