require 'osrm_api/response/base_object'

module OSRM
  module Response
    class RouteObject < BaseObject
      attr_reader :geometry, :summary, :instructions, :name
      private
      def cast
        if @origin_response['status'] == 0
          @geometry = @origin_response['route_geometry']
          @summary = @origin_response['route_summary']
          @name = @origin_response['route_name']
          @instructions = @origin_response['route_instructions']
        end
      end
    end
  end
end


