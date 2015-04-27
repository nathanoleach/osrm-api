require 'osrm_api/response/locate_object'

module OSRM
  module Response
    # :nodoc
    class NearestObject < LocateObject
      attr_reader :name

      private

      def cast
        super { @name = @origin_response['name'] }
      end
    end
  end
end
