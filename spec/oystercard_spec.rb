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

    it "should not allow to top up to more than 90" do
      topup = Oystercard::DEFAULT_LIMIT + 1
      expect { subject.top_up(topup) }.to raise_error RuntimeError
    end
  end
end
