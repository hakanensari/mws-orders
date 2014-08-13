require "mws/orders/entity"

module MWS
  module Orders
    class InvoiceData < Entity
      attribute(:invoice_requirement) do
        text_at_xpath("InvoiceRequirement")
      end

      attribute(:buyer_selected_invoice_category) do
        text_at_xpath("BuyerSelectedInvoiceCategory")
      end

      attribute(:invoice_title) do
        text_at_xpath("InvoiceTitle")
      end

      attribute(:invoice_information) do
        text_at_xpath("InvoiceInformation")
      end
    end
  end
end
