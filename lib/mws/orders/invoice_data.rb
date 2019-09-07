# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#InvoiceData
    class InvoiceData < Entity
      attribute(:invoice_requirement) do
        string('InvoiceRequirement')
      end

      attribute(:buyer_selected_invoice_category) do
        string('BuyerSelectedInvoiceCategory')
      end

      attribute(:invoice_title) do
        string('InvoiceTitle')
      end

      attribute(:invoice_information) do
        string('InvoiceInformation')
      end
    end
  end
end
