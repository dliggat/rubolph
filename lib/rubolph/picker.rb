module Rubolph
  class Picker

    def initialize(participants, exclusions={})
      @participants = participants
      @exclusions   = exclusions
      @results      = {}
    end


    def pick
      @iteration = 0
      loop do
        @results  = { }
        receivers = @participants.shuffle
        @participants.each do |giver|
          @results[giver] = receivers.delete(receivers.sample)
        end

        valid = true
        @results.each do |giver, receiver|
          if giver == receiver || @exclusions[giver] == receiver
            valid = false
            break
          end
        end
        break if valid

        @iteration += 1 and handle_irreconcilable
      end
      @results
    end

    private
    def handle_irreconcilable
      if @iteration > 10000
        raise ArgumentError.new 'Unable to reconcile participants with exclusions!'
      end
    end
  end
end
