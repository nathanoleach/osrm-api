require 'uri/https'
module OSRM
  module Request
    # :nodoc
    class BaseRequest
      LOC_PARAM = :loc

      # Contains service path
      # @return [Symbol]
      def service
        fail 'Specify the PATH to the Service'
      end

      # Contains default parameters for specially API request
      # @return [Hash]
      def default_params
        @default_params ||= {}
      end

      # @return [Array]
      def params
        @params ||= []
      end

      def add_param(key, value)
        params << [key, value]
      end

      # @param [String] host
      # @param [Fixnum] port
      # @return [URI]
      def build_uri(host, port)
        URI::HTTP.build(
            host: host,
            port: port.to_i,
            path: "/#{service}",
            query: URI.encode_www_form(params +
                       default_params.map { |key, item| [key, item] })
        )
      end
    end
  end
end
