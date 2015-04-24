require 'osrm_api/request/base_request'

module OSRM
  module Request
    # :nodoc
    class NearestRequest < BaseRequest
      def initialize(location)
        add_param LOC_PARAM, location.split.join
      end

      def service
        :nearest
      end
    end
  end
end
