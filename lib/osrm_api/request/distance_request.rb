require 'osrm_api/request/base_request'
module OSRM
  module Request
    # :nodoc
    class DistanceRequest < BaseRequest
      def initialize(*locations)
        locations = locations.compact.reject(&:empty?)
        locations.each { |item| add_param LOC_PARAM, item.split.join }
      end

      def service
        :table
      end
    end
  end
end
