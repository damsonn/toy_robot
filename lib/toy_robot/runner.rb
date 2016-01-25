require 'slop'
require 'highline'
require 'colorize'

module ToyRobot
  # -- Entry point for the toy robot
  class Runner
    def initialize(args)
      # parse options
      @opts = Slop.parse args do |o|
        o.string '-f', '--file', 'process from file instead of std input'
        o.on '--version', 'print the version' do
          puts ToyRobot::VERSION
          exit
        end
        o.on '--rules', 'print the rules' do
          puts File.read('RULES')
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
          f.each { |c| with_silent_error_handling { parse_command(c) } }
        end
      else
        interactive
      end
    end

    private

    def interactive
      cli = HighLine.new
      loop do
        command = cli.ask 'Please enter your command'.yellow
        break if command.empty? || /^(EXIT|exit)$/ =~ command
        with_verbose_error_handling { parse_command(command) }
      end
    end

    def with_verbose_error_handling
      yield
      puts 'Command executed!'.green
    rescue ToyRobot::Error => e
      puts e.message.red
    end

    def with_silent_error_handling
      yield
    rescue ToyRobot::Error # rubocop:disable Lint/HandleExceptions
    end

    def parse_command(c)
      case c
      when /^PLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
        @robot.place($1.to_i, $2.to_i, $3.downcase.to_sym)
      when /^LEFT$/
        @robot.left
      when /^RIGHT$/
        @robot.right
      when /^MOVE$/
        @robot.move
      when /^REPORT$/
        puts "My position is #{@robot.report.upcase}".blue
      else
        raise NoCommandError, "Can't execute this command"
      end
    end
  end
end
