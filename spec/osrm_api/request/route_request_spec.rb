require 'rspec'
require 'spec_helper'

describe OSRM::Request::RouteRequest do
  subject(:factory) { described_class }
  HOST = 'ex.com'
  PORT = 5000

  it 'should contain service' do
    obj = factory.new('')
    expect(obj.service.length).not_to eq(0)
  end

  it 'should build correct query' do
    obj = factory.new('12.12,-12.12', '13.13,-13.13')
    uri = obj.build_uri(HOST, PORT)
    expect(URI.decode(uri.query).include?('loc=12.12,-12.12&loc=13.13,-13.13')).to eq(true)
  end

  it 'should can edit default params' do
    obj = factory.new('12.12,-12.12', '-13.13,13.12')
    obj.default_params[:z] = 'z'
    uri = obj.build_uri(HOST, PORT)
    expect(URI.decode(uri.query).include?('z=z')).to eq(true)
  end
end
