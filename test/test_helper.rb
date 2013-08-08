$:.unshift(File.expand_path('../../lib', __FILE__))
require 'mws-orders'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

include MWS::Orders
