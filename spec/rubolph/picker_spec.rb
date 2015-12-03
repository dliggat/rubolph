require 'spec_helper'

describe Rubolph::Picker do

  before :each do
    @participants = [:dad, :mum, :bro1, :bro2, :sis1, :bro1spouse]
    @exclusions   = { dad:        :mum,
                      mum:        :dad,
                      bro1:       :bro1spouse,
                      bro1spouse: :bro1 }
  end

  it 'should handle an empty case' do
    obj     = described_class.new []
    results = obj.pick
    expect(results).to eq({})
  end

  it 'should handle a trivial case' do
    obj     = described_class.new [:a, :b]
    results = obj.pick
    expect(results[:a]).to eq(:b)
    expect(results[:b]).to eq(:a)
  end

  it 'should assign everyone as a giver and givee, and work without exclusions' do
    10000.times do
      obj     = described_class.new @participants
      results = obj.pick

      # Givers shouldn't be receivers.
      results.each do |giver, receiver|
        expect(giver).not_to eq(receiver)
      end

      # Everyone should be represented.
      expect(results.keys.sort).to eq(@participants.sort)
      expect(results.values.sort).to eq(@participants.sort)
      @participants.each do |participant|
        expect(results.keys.include? participant).to eq(true)
        expect(results.values.include? participant).to eq(true)
      end

    end
  end

  it 'should assign everyone as a giver and givee, and obey exclusions' do
    10000.times do
      obj     = described_class.new @participants, @exclusions
      results = obj.pick

      # Givers shouldn't be receivers.
      results.each do |giver, receiver|
        expect(giver).not_to eq(receiver)
      end

      # Exclusions should be addressed.
      @exclusions.each do |giver, receiver|
        expect(results[giver]).not_to eq(receiver)
      end

      # Everyone should be represented.
      expect(results.keys.sort).to eq(@participants.sort)
      expect(results.values.sort).to eq(@participants.sort)
      @participants.each do |participant|
        expect(results.keys.include? participant).to eq(true)
        expect(results.values.include? participant).to eq(true)
      end

    end
  end

  it 'should fail gracefully if the exclusions provided are impossible to satisfy' do
    obj = described_class.new [:a, :b], {a: :b, b: :a}
    expect {
      obj.pick
    }.to raise_error(ArgumentError, /Unable to reconcile/)

  end
end
