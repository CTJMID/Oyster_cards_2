

class Journey

    attr_accessor :entry
    attr_accessor :exit
  
    def initialize(*entry)
        @entry = entry
    end

    def finish(*exit)
        @exit = exit
    end

    def complete?
     entry.any? && exit.any?
    end

    def fare 
      return 6 unless complete?
      return 1
    end


end