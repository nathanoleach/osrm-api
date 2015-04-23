require 'osrm_api/request/base_request'
module OSRM
  module Request
    class DistanceRequest < BaseRequest

      def initialize(*locations)
        locations = locations.compact.reject(&:empty?)
        locations.each { |item| add_param LOC_PARAM, item.split.join }
      end

      def service
        :distance
      end
    end
  end
end