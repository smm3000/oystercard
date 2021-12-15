class Oystercard
    attr_reader :balance

    LIMIT = 90
    Minimum_Balance = 1
    Minimum_Fare = 1
    
    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(amount)
        (balance + amount) > LIMIT ? fail("Balance cannot exceed £#{LIMIT}.") : @balance += amount
    end 
        
    def touch_in
        fail "Insufficient balance to touch in" if balance < Minimum_Balance
        @journey_status = true 
    end 

    def touch_out
        deduct(Minimum_Fare)
        @journey_status = false
    end

    def in_journey?
        @journey_status
    end 
    
    private
    def deduct(fare)
        @balance -= fare
    end
end