module MWS
  module Orders
    module Parser
      class Model < Base
        include Structure

        def float_at_xpath(path)
          str = text_at_xpath(path)
          str.to_f if str
        end

        def integer_at_xpath(path)
          str = text_at_xpath(path)
          str.to_i if str
        end

        # TODO: Test this against JPY. It will most probably require special
        # handling.
        def money_at_xpath(path)
          return unless amount = float_at_xpath("#{path}/Amount")
          currency_code = text_at_xpath("#{path}/CurrencyCode")

          Money.new(amount * 100, currency_code)
        end

        def text_at_xpath(path)
          node = at_xpath(path)
          node.text if node
        end

        def time_at_xpath(path)
          str = text_at_xpath(path)
          Time.parse(CGI.unescape(str)) if str
        end
      end
    end
  end
end
