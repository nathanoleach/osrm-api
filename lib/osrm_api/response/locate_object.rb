require 'osrm_api/response/base_object'

module OSRM
  module Response
    # :nodoc
    class LocateObject < BaseObject
      attr_reader :lat, :lon

      private

      def cast
        return unless @origin_response['status'] == 0
        @lat, @lon = @origin_response['mapped_coordinate']
        yield if block_given?
      end
    end
  end
end
