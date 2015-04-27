require 'rspec'

describe OSRM::Response::NearestObject do
  subject(:factory) { described_class }
  describe '#Instantiate' do
    it '#with valid params' do
      json = JSON.parse(fixture('nearest.json').read)
      obj = factory.new json
      expect(obj.name).to eq(json['name'])
    end
  end
end
