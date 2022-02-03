class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
  
  attr_reader :balance
  attr_reader :entry_station
  
  def initialize
    @balance = 0
    @entry_station = nil 
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "minimum amount needed, £1" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def in_journey?
    !!entry_station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  
private
  def deduct(fare)
    @balance -= fare
  end
  

end