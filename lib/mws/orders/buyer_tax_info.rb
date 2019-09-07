# frozen_string_literal: true

require 'mws/orders/entity'
require 'mws/orders/tax_classification'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#BuyerTaxInfo
    class BuyerTaxInfo < Entity
      attribute :company_legal_name do
        string('CompanyLegalName')
      end

      attribute(:taxing_region) do
        string('TaxingRegion')
      end

      attribute(:tax_classifications) do
        entities('TaxClassifications/TaxClassification', TaxClassification)
      end
    end
  end
end
