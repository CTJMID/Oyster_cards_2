class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
  
  attr_reader :balance, :journey_history, :entry_station, :exit_station
  
  
  def initialize
    @balance = 0
    @journey_history = []
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

  def touch_out(exit_station)
    # journey = {}
    deduct(MINIMUM_BALANCE)
    @exit_station = exit_station
    move_journey_to_history
    # journey.store(entry_station, exit_station)
    @entry_station = nil
    # @journey_history << journey
  end

  
private
  def deduct(fare)
    @balance -= fare
  end

  def move_journey_to_history
    journey = {}
    journey.store(entry_station, exit_station)
    @journey_history << journey
  end
  

end