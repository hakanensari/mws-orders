# frozen_string_literal: true

require 'minitest/autorun'
require 'mws-orders'

begin
  require 'pry'
rescue LoadError
end

I18n.enforce_available_locales = false

module MiniTest
  class Test
    include MWS::Orders

    def load_xml_fixture(type)
      file = File.expand_path("../fixtures/#{type}.xml", __FILE__)
      body = File.read(file)

      Nokogiri(body)
    end
  end
end
