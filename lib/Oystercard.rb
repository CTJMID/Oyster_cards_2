class Oystercard

  MAXIMUM_BALANCE = 90  
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_use = true
  end

  def in_journey?
    @in_use
  end

  def touch_out
    @in_use = false
  end

  

  

end