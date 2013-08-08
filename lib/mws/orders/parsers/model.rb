module MWS
  module Orders
    module Parser
      class Model < Base
        def text_at_xpath(path)
          at_xpath(path).text
        end

        def integer_at_xpath(path)
          at_xpath(path).text.to_i
        end

        def float_at_xpath(path)
          at_xpath(path).text.to_f
        end

        # TODO: Test this against JPY. It will most probably require special
        # handling.
        def money_at_xpath(path)
          currency_code = text_at_xpath("#{path}/CurrencyCode")
          amount = float_at_xpath("#{path}/Amount") * 100

          Money.new(amount, currency_code)
        end

        def time_at_xpath(path)
          Time.parse(CGI.unescape(text_at_xpath(path)))
        end

        private

        def at_xpath(path)
          document.at_xpath(with_namespace(path))
        end

        def with_namespace(path)
          path.split('/').map { |attr| "xmlns:#{attr}" }.join('/')
        end
      end
    end
  end
end
