module ToyRobot
  # -- General ToyRobot error
  class Error < StandardError; end

  # -- Robot needs to be placed
  class UnplacedError < Error; end

  # -- Robot must stay on the table
  class WrongMoveError < Error; end

  # -- Command doesn't exist
  class NoCommandError < Error; end
end
