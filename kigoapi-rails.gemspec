# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kigoapi/version'

Gem::Specification.new do |spec|
  spec.name          = "kigoapi-rails"
  spec.version       = KigoAPI::VERSION
  spec.authors       = ["Dalibor Horinek"]
  spec.email         = ["dal@horinek.net"]
  spec.description   = %q{Kigo Rental Agency API implementation }
  spec.summary       = %q{Kigo Rental Agency API implementation }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "rest_client", "~> 1.8"
end
