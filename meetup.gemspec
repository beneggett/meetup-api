# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meetup/version'

Gem::Specification.new do |spec|
  spec.name          = "meetup_api"
  spec.version       = Meetup::VERSION
  spec.authors       = ["Ben Eggett"]
  spec.email         = ["beneggett@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the Meetup.com API}
  spec.description   = %q{As presented in our URUG downtown meetup at http://www.meetup.com/DRUG-Downtown-Ruby-Users-Group/events/196172202/}
  spec.homepage      = "http://github.com/beneggett/meetup-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "httparty"
  spec.add_dependency "hashie"
end
