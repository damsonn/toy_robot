require 'spec_helper'

describe Position do
  subject { Position.new(0, 0) }

  it 'is immutable' do
    expect { subject.x = 1 }.to raise_error(NoMethodError)
  end

  describe '#inc_x' do
    it 'returns a new object' do
      expect(subject.inc_x).not_to eq subject
    end
  end

  describe '#in_world?' do
    it 'detects position outside' do
      expect(Position.new(0, 0).in_world?).to be true
    end

    it 'detects position inside' do
      expect(Position.new(World::WIDTH, World::HEIGHT).in_world?).to be false
    end
  end
end
