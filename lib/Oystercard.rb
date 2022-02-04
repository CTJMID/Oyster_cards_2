require_relative '../lib/journey.rb'

class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1
  
  attr_reader :balance, :journey_history, :current_journey, :journey
  
  def initialize
    @balance = 0
    @current_journey = {}
    @journey_history = []
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "minimum amount needed, £1" if balance < MINIMUM_BALANCE

    if in_journey?
      @journey.finish
      deduct(@journey.fare)
      @journey_history << @current_journey
      @current_journey = {}
    end

    @journey = Journey.new(entry_station)
    @current_journey[:entry] = entry_station
  end

  def in_journey?
    @current_journey.count == 1
  end

  def touch_out(exit_station)
    @journey = Journey.new unless in_journey?
    @journey.finish(exit_station)
    deduct(@journey.fare)
    @current_journey[:exit] = exit_station
    @journey_history << @current_journey
    @current_journey = {}
  end

  
private

  def deduct(fare)
    @balance -= fare
  end

end