require 'oystercard'

describe Oystercard do

  describe "initialize" do
    it "should have an initial balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it "Should top up card with balance passed in as argument" do
      ORIGINAL = subject.balance
      expect{subject.top_up(5)}. to change {subject.balance} .by(5)
    end
  end

end
