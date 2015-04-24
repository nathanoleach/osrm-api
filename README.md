# OsrmApi

This Gem provides interaction with [OSRM Server API](https://github.com/Project-OSRM/osrm-backend/wiki/Server-api)
 

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
route = client.route('40.723279,-73.937766', '40.90,-73.10', '40.823279,-73.937766') do |request| 
        request.add_param 'z', 7 
end
```
### Response
Response

There are 4 types of objects.

LocateCl extends base class.
There arise new qualities @lat and @lon which contain point position.

NearestCl extends Locate and adds new quality @name, which contains the name of object on the map.

DistanceCl contains in the distance quality the amount which reflects the distance between the points of the request. 

RouteCL contains geometry, summary, instructions, name qualities. If there is a necessity to get other qualities of the route, you need to call to them via orgin_response qulity of the parent class.
## Contributing

1. Fork it ( https://github.com/ikantam/osrm-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
