require 'spec_helper'

describe Robot do
  subject { Robot.new }

  describe '#initialize' do
    it 'starts with no position' do
      expect(subject.position).to be nil
    end
  end

  describe '#place' do
    it 'raise an error if placed outside the table' do
      expect { subject.place(World::WIDTH, World::HEIGHT, :east) }.to raise_error(WrongMoveError)
    end
  end

  describe '#move' do
    it 'moves a north facing robot at [0,0] to [0,1]' do
      subject.place(0, 0, :north)
      subject.move
      expect(subject.position.x).to be 0
      expect(subject.position.y).to be 1
    end

    it 'moves a east facing robot at [0,0] to [1,0]' do
      subject.place(0, 0, :east)
      subject.move
      expect(subject.position.x).to be 1
      expect(subject.position.y).to be 0
    end

    it 'raise an error if a west facing robot at [0,0]' do
      subject.place(0, 0, :west)
      expect { subject.move }.to raise_error(WrongMoveError)
      # position hasn't changed
      expect(subject.position.x).to be 0
      expect(subject.position.x).to be 0
    end

    it 'raise an error if unplaced' do
      expect { subject.move }.to raise_error(UnplacedError)
    end
  end

  describe '#left' do
    it 'turn a north facing robot to west' do
      subject.place(0, 0, :north)
      subject.left
      expect(subject.facing).to eq :west
    end

    it 'raise an error if unplaced' do
      expect { subject.left }.to raise_error(UnplacedError)
    end
  end

  describe '#right' do
    it 'turn a north facing robot to east' do
      subject.place(0, 0, :north)
      subject.right
      expect(subject.facing).to eq :east
    end

    it 'raise an error if unplaced' do
      expect { subject.right }.to raise_error(UnplacedError)
    end
  end

  describe '#report' do
    it 'reports position' do
      subject.place(0, 0, :north)
      expect(subject.report).to include('0,0')
    end

    it 'reports facing direction' do
      subject.place(0, 0, :north)
      expect(subject.report).to include('north')
    end

    it 'raise an error if unplaced' do
      expect { subject.report }.to raise_error(UnplacedError)
    end
  end
end
