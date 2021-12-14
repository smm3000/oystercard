require 'oystercard'

describe Oystercard do
    it 'returns 0 balance as default' do 
        expect(subject.balance).to eq 0
    end

    describe '#top_up' do
        it 'responds to top up' do
            expect(subject).to respond_to(:top_up)
        end

        it 'responds to top up' do
            expect(subject).to respond_to(:top_up).with(1).argument
        end

        #previous pair programming:
        it 'adds 50 value to oystercard' do 
            expect(subject.top_up(50)).to eq 50
        end 

        it 'adds any value to oystercard' do
            amount = rand(100)
            expect(subject.top_up(amount)).to eq amount
        end 
    end   
    
    describe '#top_up limit' do
        it 'returns error if balance is above limit' do
            new_card = Oystercard.new(91)
            LIMIT = 90
            expect{new_card.top_up(0)}.to raise_error("Balance cannot exceed £#{LIMIT}.")
        end 
    end

    describe '#deduct' do
        it 'deducts fare from oystercard' do
            expect(subject).to respond_to(:deduct)
        end

        it 'deducts £50 value from oystercard' do 
            new_card = Oystercard.new(0)
            expect(subject.deduct(50)).to eq (new_card.balance - 50)
        end 
    end

    describe '#touch_in' do
        it '#touch_in for oystercard' do 
            subject.touch_in
            expect(subject).to be_in_journey
        end 
    end 

    describe '#touch_out' do
        it '#touch_out for oystercard' do 
            expect(subject).to respond_to(:touch_out)
        end 
    end 
  
    describe '#in_journey' do
        it 'is initially not in a journey' do
            expect(subject).not_to be_in_journey
        end
    end 
    
end
