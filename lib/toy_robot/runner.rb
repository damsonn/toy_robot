module ToyRobot
  # -- Entry point for the toy robot
  class Runner
    def self.start
      puts <<-'EOS'
    ______               ____        __          __
   /_  __/___  __  __   / __ \____  / /_  ____  / /_
    / / / __ \/ / / /  / /_/ / __ \/ __ \/ __ \/ __/
   / / / /_/ / /_/ /  / _, _/ /_/ / /_/ / /_/ / /_
  /_/  \____/\__, /  /_/ |_|\____/_.___/\____/\__/
            /____/
      EOS
    end
  end
end
