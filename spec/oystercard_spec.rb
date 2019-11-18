require 'oystercard'

describe Oystercard do

  describe "initialize" do
    it "should have an initial balance of 0" do
      expect(subject.balance).to eq(0)
    end

    it "is initially not in journey" do
      expect(subject).not_to be_in_journey
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

  describe "#deduct" do
    it "Deduct given quanitity from balance" do
      subject.top_up(5)
      expect{subject.deduct(5)}. to change{subject.balance} .by(-5)
    end

    it "Prevent deduction if balance would be negative" do
      expect{subject.deduct(5)}. to raise_error "insufficient funds"
    end

  end

  describe "#touch_in" do
    let(:oystercard) { double (:oystercard)}
    it "should set to in journey after touching in" do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end


    it "Prevent entry if money on card is less than the minimum fare." do
      expect{subject.touch_in}. to raise_error "insufficient funds for entry" do
    end
  end
  end

  describe "#touch_out" do
    it "should not be in journey after touching out" do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe "#in_journey?" do
  it "should true after touching in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end
end



  # touch in
  # touch out
  # in_journey
end
