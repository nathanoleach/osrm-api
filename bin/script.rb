#!/usr/bin/ruby
require 'osrm_api'
options = { }
client = OSRM::Client.new(options)
lc = client.route('40.725160,-73.998794', '42.725160,-73.998794')
