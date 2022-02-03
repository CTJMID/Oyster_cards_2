

class Journey

    # attr_reader :journey_history

    # def initialize
    #     # @journey_history = []
    # end

    def in_journey?
      !!entry_station
    end

    def move_journey_to_history
        journey = {}
        journey.store(entry_station, exit_station)
        @journey_history << journey
    end


end