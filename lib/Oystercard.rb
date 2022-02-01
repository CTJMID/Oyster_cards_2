class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "minimum amount needed, £1" if balance < MINIMUM_BALANCE
    @in_use = true
    
  end

  def in_journey?
    @in_use 
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_use = false
  end

  
private
  def deduct(fare)
    @balance -= fare
  end
  

end