require 'osrm_api/response/base_object'

module OSRM
  module Response
    # :nodoc
    class DistanceObject < BaseObject
      attr_reader :distance_table

      private

      def cast
        @distance_table = @origin_response['distance_table']
      end
    end
  end
end
