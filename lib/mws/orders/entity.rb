# frozen_string_literal: true

require 'cgi'
require 'time'
require 'money'
require 'structure'
require 'mws/orders/document'

module MWS
  module Orders
    # A parsed object
    class Entity < Document
      include Structure

      def boolean(path)
        string(path) == 'true'
      end

      def entities(path, klass)
        xpath(path).map { |node| klass.new(node) }
      end

      def entity(path, klass)
        node = at_xpath(path)
        klass.new(node) if node
      end

      def float(path)
        string(path)&.to_f
      end

      def integer(path)
        string(path)&.to_i
      end

      def money(path)
        amount = float("#{path}/Amount")
        return unless amount

        currency_code = string("#{path}/CurrencyCode")
        amount *= 100 unless currency_code == 'JPY'

        Money.new(amount, currency_code)
      end

      def string(path)
        at_xpath(path)&.text&.strip
      end

      def time(path)
        text = string(path)
        Time.parse(CGI.unescape(text)) if text
      end
    end
  end
end
