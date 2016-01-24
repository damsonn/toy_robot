require 'spec_helper'

describe ToyRobot::Runner do
  subject { ToyRobot::Runner }
  describe '#start' do
    it 'output to stdout' do
      expect { subject.start }.to output.to_stdout
    end
  end
end
