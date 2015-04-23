require 'osrm_api/response/base_object'

module OSRM
  module Response
    class LocateObject < BaseObject
      attr_reader :lat, :lon

      private
      def cast
        if @origin_response['status'] == 0
          @lat, @lon = @origin_response['mapped_coordinate']
          if block_given?
            yield
          end
        end
      end
    end
  end
end

