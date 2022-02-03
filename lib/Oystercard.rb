require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
  
  attr_reader :balance, :entry_station, :exit_station  :journey_history
  
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

  # def in_journey?
  #   !!entry_station
  # end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @exit_station = exit_station
    move_journey_to_history
    @entry_station = nil
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