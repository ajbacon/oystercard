class Oystercard
   attr_reader :balance

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise RuntimeError, "Balance cannot exceed £#{DEFAULT_LIMIT}" if (amount + @balance) > DEFAULT_LIMIT
    @balance += amount
  end 

end
