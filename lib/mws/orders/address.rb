# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#Address
    class Address < Entity
      attribute(:name) do
        string('Name')
      end

      attribute(:lines) do
        1.upto(3).map { |i| string("AddressLine#{i}") }.compact
      end

      attribute(:city) do
        string('City')
      end

      attribute(:state_or_region) do
        string('StateOrRegion')
      end

      attribute(:postal_code) do
        string('PostalCode')
      end

      attribute(:country_code) do
        string('CountryCode')
      end

      attribute(:phone) do
        string('Phone')
      end
    end
  end
end
