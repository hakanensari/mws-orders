# frozen_string_literal: true

require 'cgi'
require 'time'
require 'money'
require 'structure'
require 'mws/orders/document'

module MWS
  module Orders
    class Entity < Document
      include Structure

      def float_at_xpath(path)
        text = text_at_xpath(path)
        text&.to_f
      end

      def integer_at_xpath(path)
        text = text_at_xpath(path)
        text&.to_i
      end

      def money_at_xpath(path)
        amount = float_at_xpath("#{path}/Amount")
        return unless amount

        currency_code = text_at_xpath("#{path}/CurrencyCode")
        amount *= 100 unless currency_code == 'JPY'

        Money.new(amount, currency_code)
      end

      def time_at_xpath(path)
        text = text_at_xpath(path)
        Time.parse(CGI.unescape(text)) if text
      end

      def text_at_xpath(path)
        node = xpath(path).first
        node&.text&.strip
      end
    end
  end
end
