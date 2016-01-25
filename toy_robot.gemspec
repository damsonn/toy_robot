# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robot/version'

Gem::Specification.new do |spec|
  spec.name          = "toy_robot"
  spec.version       = ToyRobot::VERSION
  spec.authors       = ["Damien Dormal"]
  spec.email         = ["dormal.damien@gmail.com"]

  spec.summary       = %q{The Toy Robot Simulator}
  spec.description   = spec.description
  spec.homepage      = "https://github.com/damsonn/toy_robot"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["toy_robot"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize", "~> 0.7"
  spec.add_runtime_dependency "slop", "~> 4.2"
  spec.add_runtime_dependency "highline", "~> 1.7"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
