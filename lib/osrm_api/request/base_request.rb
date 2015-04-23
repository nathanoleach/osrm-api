require 'uri/https'
module OSRM
  module Request
    class BaseRequest

      LOC_PARAM = 'loc'.freeze

      def service
        raise 'Specify the PATH to the Service'
      end

      def default_params
        @default_params ||= {}
      end

      def params
        @params ||= []
      end

      def add_param(key, value)
        params << [key, value]
      end

      def build_uri(host, port)
        URI::HTTP.build(
            host: host,
            port: port.to_i,
            path: "/#{service}",
            query: URI.encode_www_form(params + default_params.map { |key, item| [key, item] })
        )
      end

    end
  end
end