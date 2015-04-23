require 'osrm_api/request/base_request'
module OSRM
  module Request
    class RouteRequest < BaseRequest

      OUTPUT_PARAM = 'output'.freeze
      ALT_PARAM = 'alt'.freeze

      def service
        :viaroute
      end

      def default_params
        @default_params ||= {
            OUTPUT_PARAM => :json,
            ALT_PARAM => :false,
        }
      end

      def initialize(*locations)
        locations = locations.compact.reject(&:empty?)
        locations.each_with_index { |item, _key| add_param LOC_PARAM, item.split.join }
      end
    end
  end
end