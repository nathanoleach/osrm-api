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
      # https://router.project-osrm.org/table/v1/driving/-70.4429342,43.6796943;-71.0595678,42.3604823
      # client = OSRM::Client.new(host: 'router.project-osrm.org', port: 443)
      # distance = client.distance('40.723279,-73.937766', '40.90,-73.10', '40.82279,-73.937766')
      def build_uri(host, port)
        locations = ''
        params.each do |param|
          #locations += param[1].to_s + ';'
          if !locations.blank?
            locations += ";"
          end
          locations += params.first[1].split(",")[1].to_s + "," + params.first[1].split(",")[0].to_s
        end
        #byebug
        URI::HTTPS.build(
            host: host,
            #port: port.to_i,
            path: "/#{service}/v1/driving/" + locations #,
            # query: locations #(params + default_params.map { |key, item| [key, item] })
        )
      end
    end
  end
end
