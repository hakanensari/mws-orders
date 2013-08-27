module MWS
  module Orders
    module Parser
      class ServiceStatusMessage < Model
        value :locale do
          text_at_xpath('Locale')
        end

        value :text do
          text_at_xpath('Text')
        end
      end
    end
  end
end
