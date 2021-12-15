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
            amount = rand(90)
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

    describe '#touch_in' do
        it '#touch_in for oystercard' do 
            new_card = Oystercard.new(40)
            new_card.touch_in
            expect(new_card).to be_in_journey
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

    describe 'that oystercard responds to balance' do
        it 'returns checks that oystercard responds to balance' do
            expect(subject).to respond_to(:balance)
        end 
    end 

   describe 'minimum balance check' do
        it 'will not touch in if below minimum balance' do 
            expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
        end 
    end 

    describe '#touch_put to reduce balance' do
        it 'reduces balance by the fare' do
            expect { subject.touch_out }. to change{ subject.balance }.by(-Oystercard::Minimum_Fare)
        end 
    end 
   





    #Notes SM:
    # I want to have a test that:
    # Checks that the balance of the oystercard is above a minimum balance (£1)
    # If it does not pass - then the test returns a error msg.

    # you can first check if the test will repsond to balance?

   #=begin 
   # describe 'when balance is below minimum fare return error msg' do
    #it 'returns error message when balance below minimum' do
    #    expect(subject.balance).to raise_error(balance < 1)
   #end 

    
end
