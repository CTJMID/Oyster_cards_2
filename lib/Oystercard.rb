

class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
<<<<<<< HEAD
  attr_reader :balance, :entry_station
  
  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
=======
  attr_reader :balance
  attr_reader :entry_station
  def initialize
    @balance = 0
    @entry_station = nil 
>>>>>>> 1e539ef032716ee07a9cfa52d37f0821d8298cfe
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

<<<<<<< HEAD
  def touch_in(entry_station)
    fail "minimum amount needed, £1" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def in_journey?
    !!entry_station
=======
  def touch_in(station)
    fail "minimum amount needed, £1" if balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def in_journey?
    !!@entry_station
    
>>>>>>> 1e539ef032716ee07a9cfa52d37f0821d8298cfe
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
<<<<<<< HEAD
    @entry_station = nil
=======
    
    @entry_station = nil 
>>>>>>> 1e539ef032716ee07a9cfa52d37f0821d8298cfe
  end

  
private
  def deduct(fare)
    @balance -= fare
  end
  

end