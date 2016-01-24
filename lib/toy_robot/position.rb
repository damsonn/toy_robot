module ToyRobot
  # -- A position relative to the World. immutable object
  class Position
    include World
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def in_world?
      x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
    end

    def inc_x
      Position.new(@x + 1, @y)
    end

    def dec_x
      Position.new(@x - 1, @y)
    end

    def inc_y
      Position.new(@x, @y + 1)
    end

    def dec_y
      Position.new(@x, @y - 1)
    end

    def to_s
      "[#{x}, #{y}]"
    end
  end
end
