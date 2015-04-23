require 'net/https'
require 'json'

require 'osrm_api/request/route_request'
require 'osrm_api/response/route_object'

require 'osrm_api/request/locate_request'
require 'osrm_api/response/locate_object'


module OSRM

  class Client

    DEFAULT_OPTIONS = {
      host: 'localhost',
      port: '5000',
    }.freeze

    # @return [OSRM::Client]
    def initialize(options = {})
      @options = DEFAULT_OPTIONS.merge(options)
    end


    # @return [Response::LocateObject]
    def locate(location)
      request = Request::LocateRequest.new(location)
      if block_given?
        yield
      end
      Response::LocateObject.new execute request
    end


    # @return [Response::RouteObject]
    def route(*locations)
      request = Request::RouteRequest.new(*locations)
      if block_given?
        yield
      end
      Response::RouteObject.new execute request
    end

    # @return [Response::NearestObject]
    def nearest(location)
      request = Request::NearestRequest.new(location)
      if block_given?
        yield
      end
      Response::NearestObject.new execute request
    end

    # @param [Array] locations
    # @return [Response::DistanceObject]
    def distance_matrix(*locations)
      request = Request::DistanceRequest.new(*locations)
      if block_given?
        yield
      end
      Response::DistanceObject.new execute request
    end


    private

    # @param [OSRM::Request::BaseRequest] request
    def execute(request)
      res = Net::HTTP.get_response(request.build_uri @options[:host], @options[:port])

      JSON.parse(res.body)
    end
  end
end