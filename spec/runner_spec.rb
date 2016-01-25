require 'spec_helper'

describe Runner do
  EXAMPLES = [
    { input: 'spec/examples/a.txt', output: /0,1,NORTH/ },
    { input: 'spec/examples/b.txt', output: /0,0,WEST/ },
    { input: 'spec/examples/c.txt', output: /3,3,NORTH/ }
  ]
  describe 'file input mode' do
    EXAMPLES.each do |example|
      it "process #{example[:input]}" do
        runner = Runner.new(['-f', example[:input]])
        expect { runner.start }.to output(example[:output]).to_stdout
      end
    end
  end
  describe 'interactive mode' do
  end
end
