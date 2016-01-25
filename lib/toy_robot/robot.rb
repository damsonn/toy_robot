module ToyRobot
  # -- The robot, it can move, turn and report position
  class Robot
    include World

    attr_reader :position, :facing

    def initialize
      @position = nil
    end

    # -- Place the robot on the table
    def place(x, y, facing)
      tentative_postion = Position.new(x, y)
      check_position(tentative_postion)
      @position = tentative_postion
      @facing = facing
    end

    # -- Move the robot one step forward
    def move
      check_placed
      new_position = case facing
                     when :north then @position.inc_y
                     when :south then @position.dec_y
                     when :east then @position.inc_x
                     when :west then @position.dec_y
                     end
      check_position(new_position)
      @position = new_position
    end

    # -- Turn robot to the left
    def left
      check_placed
      @facing = next_facing(-1)
    end

    # -- Turn robot to the right
    def right
      check_placed
      @facing = next_facing(+1)
    end

    # -- Report the robot position
    def report
      check_placed
      "#{position},#{facing}"
    end

    private

    # -- find a direction, based on current facing direction and a number of 90 degree steps
    def next_facing(steps)
      current_index = DIRECTIONS.find_index(@facing)
      DIRECTIONS[(current_index + steps) % DIRECTIONS.size]
    end

    def check_placed
      raise UnplacedError, 'I need to be placed on the table first' if position.nil?
    end

    def check_position(position)
      raise WrongMoveError, 'I will fall if you do that' unless position.in_world?
    end
  end
end
