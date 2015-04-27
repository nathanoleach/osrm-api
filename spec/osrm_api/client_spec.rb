require 'spec_helper'
require 'rspec'
require 'osrm_api'

describe OSRM::Client do
  TEST_HOST = 'example.com'
  subject(:factory) { described_class }

  describe '#Instantiate object' do
    it '#with invalid params' do
      WebMock.disable!
      obj = factory.new(host: 'bla-bla-bla')
      expect { obj.route('12.12,-12.1', '123.1,-34.1') }
        .to raise_error(SocketError)
    end

    it '#with correct' do
      WebMock.enable!
      query_string  = 'locate?loc=12.12,-12.12'
      stub_request(:any, 'http://' + TEST_HOST + ':5000/' + query_string)
        .to_return(body: JSON.generate(status: 0, mapped_coordinate: [1, 2]))
      obj = factory.new(host: TEST_HOST)
      expect(obj.locate('12.12, -12.12')).to_not eq(nil)
    end
  end
end
