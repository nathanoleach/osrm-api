# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'osrm_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'osrm_api'
  spec.version       = OSRM::VERSION
  spec.authors       = ['IgorPetuh']
  spec.email         = ['i.petuh@icloud.com']
  spec.summary       = 'OSRM API'
  spec.description   = ''
  spec.homepage      = 'https://github.com/ikantam/osrm-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version     = '>= 2.0.0'
  spec.required_rubygems_version = '>= 1.8.11'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
