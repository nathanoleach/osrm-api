require 'rspec'
require 'spec_helper'

describe OSRM::Response::DistanceObject do
  subject(:factory) { described_class }
  describe '#Instantiate' do
    it 'should contain distance array' do
      json = JSON.parse(fixture('distance.json').read)
      obj = factory.new json
      expect(obj.distance_table).to eq(json['distance_table'])
    end
  end
end
