class Oystercard
    attr_reader :balance

    LIMIT = 90
    
    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(amount)
        (balance + amount) > 90 ? fail("Balance cannot exceed £#{LIMIT}.") : @balance += amount
    end 

    def deduct(amount)
        @balance -= amount
    end
        
    def touch_in
        @journey_status = true 
    end 

    def touch_out
        @journey_status = false

    end

    def in_journey?
        @journey_status
    end 
end