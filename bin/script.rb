#! /usr/bin/ruby
require 'osrm_api'
options = { host: '54.164.118.105', port: 5000 }
client = OSRM::Client.new(options)
lc = client.route('40.725160,-73.998794', '40.725160,-73.908794')
