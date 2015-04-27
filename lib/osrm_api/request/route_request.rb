require 'osrm_api/request/base_request'
module OSRM
  module Request
    # :nodoc
    class RouteRequest < BaseRequest
      OUTPUT_PARAM = :output
      ALT_PARAM = :alt
      Z_PARAM = :z
      GEO_PARAM = :geometry

      def service
        :viaroute
      end

      def default_params
        @default_params ||= {
          OUTPUT_PARAM => :json,
          ALT_PARAM => :false
        }
      end

      def initialize(*locations)
        locations = locations.compact.reject(&:empty?)
        locations.each { |item|  add_param LOC_PARAM, item.split.join }
      end
    end
  end
end
