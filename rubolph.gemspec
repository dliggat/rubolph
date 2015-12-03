lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubolph/version'

Gem::Specification.new do |spec|
  spec.name          = "rubolph"
  spec.version       = Rubolph::VERSION
  spec.authors       = ["Dave Liggat"]
  spec.email         = ["dave@liggat.org"]
  spec.summary       = "A gem for generating secret santa assignments"
  spec.homepage      = "https://liggat.org"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = spec.files.grep(%r{^lib/tasks/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  # spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "fuubar", "~> 2.0"
  spec.add_development_dependency "guard-rspec"
  # spec.add_dependency "activesupport"
  # spec.add_dependency "activemodel"
  # spec.add_dependency "hashie"
end
