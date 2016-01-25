require 'spec_helper'
require 'highline'

describe Runner do
  EXAMPLES = [
    { input: 'spec/examples/a.txt', output: /0,1,NORTH/ },
    { input: 'spec/examples/b.txt', output: /0,0,WEST/ },
    { input: 'spec/examples/c.txt', output: /3,3,NORTH/ },
    { input: 'spec/examples/d.txt', output: /0,2,NORTH/ }
  ]

  describe 'file input mode' do
    EXAMPLES.each do |example|
      it "process #{example[:input]}" do
        runner = Runner.new(['--file', example[:input]])
        expect { runner.start }.to output(example[:output]).to_stdout
      end
    end
  end

  describe 'CLI options' do
    before do
      # needs to stub exit so it doesn't stop our spec
      allow_any_instance_of(Runner).to receive(:exit).and_return(nil)
    end

    it 'displays the help' do
      expect { Runner.new(['--help']) }.to output(/usage/).to_stdout
    end

    it 'displays the rules' do
      expect { Runner.new(['--rules']) }.to output(/Toy Robot Simulator/).to_stdout
    end

    it 'displays the version' do
      expect { Runner.new(['--version']) }.to output(/#{ToyRobot::VERSION}/).to_stdout
    end
  end
end
