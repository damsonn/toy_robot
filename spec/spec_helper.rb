require 'simplecov'
require 'coveralls'

Coveralls.wear!

# local coverage report is at coverage/index.html
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [Coveralls::SimpleCov::Formatter, SimpleCov::Formatter::HTMLFormatter]
)
SimpleCov.start

require 'toy_robot'
include ToyRobot
