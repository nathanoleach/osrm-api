module OSRM
  module Response
    # :nodoc
    class BaseObject
      attr_accessor :origin_response

      def initialize(json)
        @origin_response = json.freeze
        cast
      end

      private

      def cast
        fail 'Method should be implemented'
      end
    end
  end
end
