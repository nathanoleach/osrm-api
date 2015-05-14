$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
$LOAD_PATH.uniq!

require 'rspec'
require 'webmock/rspec'
require 'json'
require 'osrm_api'

require 'coveralls'
Coveralls.wear!

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file))
end

RSpec.configure do |config|
  config.color = true
  config.run_all_when_everything_filtered = true
  config.raise_errors_for_deprecations!
end
