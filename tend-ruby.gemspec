# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "tend-ruby"
  spec.version       = Tend::VERSION
  spec.authors       = ["stevenbristol"]
  spec.email         = ["stevenbristol@gmail.com"]
  spec.summary       = "Ruby version of Tend.io API"
  spec.description   = "Ruby version of Tend.io API"
  spec.homepage      = "https://github.com/LessEverything/tend-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_runtime_dependency "json", "~> 1.8"
  spec.add_runtime_dependency "activesupport", ">= 0"
end
