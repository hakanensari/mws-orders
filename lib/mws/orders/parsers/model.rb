module MWS
  module Orders
    module Parser
      class Model < Base
        include Structure

        def float_at_xpath(path)
          text_at_xpath(path).to_f
        end

        def integer_at_xpath(path)
          text_at_xpath(path).to_i
        end

        # TODO: Test this against JPY. It will most probably require special
        # handling.
        def money_at_xpath(path)
          amount = float_at_xpath("#{path}/Amount") * 100
          currency_code = text_at_xpath("#{path}/CurrencyCode")

          Money.new(amount, currency_code)
        end

        def text_at_xpath(path)
          at_xpath(path).text
        end

        def time_at_xpath(path)
          Time.parse(CGI.unescape(text_at_xpath(path)))
        end
      end
    end
  end
end
