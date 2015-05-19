# OsrmApi

This Gem provides interaction with [OSRM Server API](https://github.com/Project-OSRM/osrm-backend/wiki/Server-api)
 
 [![Gem Version](https://badge.fury.io/rb/osrm_api.svg)](http://badge.fury.io/rb/osrm_api)
 [![Coverage Status](https://coveralls.io/repos/igorpetuh/osrm-api/badge.svg)](https://coveralls.io/r/igorpetuh/osrm-api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'osrm_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install osrm_api

## Usage

```ruby
require 'osrm_api'

# Initialize the client.
client = OSRM::Client.new(host: 'example.com', port: 5000)

# Perform the request
distance = client.distance('40.723279,-73.937766', '40.90,-73.10', '40.82279,-73.937766')
route = client.route('40.723279,-73.937766', '40.90,-73.10', '40.823279,-73.937766')
locate = client.locate('53.911808, 27.595035')
nearest = client.nearest('53.911808, 27.595035')
```
To connect any special settings it’s necessary to use block construction like the following one:

```ruby
route = client.route('40.723279,-73.937766', '40.90,-73.10') do |request| 
        request.add_param 'z', 7 
end
```
### Response

There are 4 types of responses.

LocateObject extends base class.
There arise new property @lat and @lon which contain point position.
```ruby
lc = client.locate('40.723279,-73.9377')
lc.lat # => '40.723274'
lc.lon # => '-73.937408'
```

NearestObject extends Locate and adds new property @name, which contains the name of object on the map.
```ruby
nr = client.nearest('40.723279,-73.9377')
nr.lat # => '40.723274'
nr.lon # => '-73.937408'
nr.name # => 'Anthony Street'
```

DistanceObject contains in the @distance_table property the amount which reflects the distance between the points of the request.
```ruby
dc = client.distance('40.723279,-73.9377', '40.723279,-73.9877')
dc.distance_table # => [[0, 3551], [4116,0]]
``` 

RouteObject contains geometry, summary, instructions, name properties. If there is a necessity to get other properties of the route, you need to call to them via @orgin_response property of the parent class.
```ruby
rt = client.route('40.723279,-73.9377', '40.723279,-73.9877')
rt.summary['total_time'] # => 355
``` 

## Contributing

1. Fork it ( https://github.com/ikantam/osrm-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
