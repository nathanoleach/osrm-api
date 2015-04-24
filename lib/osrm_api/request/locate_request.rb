require 'osrm_api/request/base_request'

module OSRM
  module Request
    # :nodoc
    class LocateRequest < BaseRequest
      def initialize(location)
        add_param LOC_PARAM, location.split.join
      end

      def service
        :locate
      end
    end
  end
end
