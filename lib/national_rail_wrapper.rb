require 'typhoeus'
require 'ox'

require "national_rail_wrapper/version"
require "national_rail_wrapper/client"

require_relative "national_rail_wrapper/feeds/knowledge_base/client"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/base"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/incidents"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/national_service_indicators"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/public_promotions"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/stations"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/ticket_restrictions"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/ticket_types"
require_relative "national_rail_wrapper/feeds/knowledge_base/requests/tocs"

require_relative "national_rail_wrapper/feeds/historical_service_performance/client"
require_relative "national_rail_wrapper/feeds/historical_service_performance/requests/base"
require_relative "national_rail_wrapper/feeds/historical_service_performance/requests/service_details"
require_relative "national_rail_wrapper/feeds/historical_service_performance/requests/service_metrics"

module NationalRailWrapper
  class Error < StandardError; end
  # Your code goes here...
end
