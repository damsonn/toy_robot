require 'slop'

module ToyRobot
  # -- Entry point for the toy robot
  class Runner
    def initialize(args)
      # parse options
      @opts = Slop.parse args do |o|
        o.string '-f', '--file', 'process from file instead of std input'
        o.bool '-v', '--verbose', 'enable verbose mode'
        o.on '--version', 'print the version' do
          puts ToyRobot::VERSION
          exit
        end
        o.on '-h', '--help' do
          puts o
          exit
        end
      end

      # create the robot
      @robot = Robot.new
    end

    def start
      # print banner
      puts <<-'EOS'
    ______               ____        __          __
   /_  __/___  __  __   / __ \____  / /_  ____  / /_
    / / / __ \/ / / /  / /_/ / __ \/ __ \/ __ \/ __/
   / / / /_/ / /_/ /  / _, _/ /_/ / /_/ / /_/ / /_
  /_/  \____/\__, /  /_/ |_|\____/_.___/\____/\__/
            /____/
      EOS

      # run in interactive mode or file input
      if @opts[:file]
        File.open(@opts[:file]) do |f|
          f.each { |c| parse_command(c) }
        end
      else
        interactive
      end
    end

    def interactive
      puts 'interactive'
    end

    private

    def parse_command(c)
      case c
      when /^PLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
        @robot.place($1.to_i, $2.to_i, $3.downcase.to_sym)
      when /^LEFT$/
        @robot.left
      when /RIGHT/
        @robot.right
      when /MOVE/
        @robot.move
      when /REPORT/
        puts @robot.report.upcase
      else
        puts "Can't process #{c}"
        # TODO: what here ?
      end
    end
  end
end
