require 'rspec'
require 'spec_helper'

describe OSRM::Response::RouteObject do
  subject(:factory) { described_class }

  describe '#Instantiate' do
    it '#with valid params' do
      obj = factory.new JSON.parse(fixture('route.json').read)
      expect(obj.summary.class).to eq(Hash)
    end

    it '#with invalid params' do
      obj = factory.new JSON.parse(fixture('invalid_route.json').read)
      expect(obj.summary.class).to eq(NilClass)
    end
  end
end
