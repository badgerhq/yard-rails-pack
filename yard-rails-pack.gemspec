# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard-rails-pack/version'

Gem::Specification.new do |spec|
  spec.name          = "yard-rails-pack"
  spec.version       = YardRailsPack::VERSION
  spec.authors       = ["Johan van Zonneveld"]
  spec.email         = ["johan@vzonneveld.nl"]
  spec.description   = %q{Add handlers for Rails DSL methods}
  spec.summary       = %q{Add handlers for Rails DSL methods}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib,templates}/**/*") + ['README.md', 'Rakefile']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'yard'
end
