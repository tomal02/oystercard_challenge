# NameError, /spec/oystercard_spec.rb, 1
require 'oystercard'
describe Oystercard do
	let(:entry_station) { double :entry_station }
	let(:exit_station) { double :exit_station }

  describe '#top_up' do

		it 'Should top up balance' do
			subject.top_up(10)
			expect(subject.balance) == 10
		end

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'Should raise an error if the balance exceeds max limit' do
			amount = 100
			expect{subject.top_up(amount)}.to raise_error "#{amount} exceeds #{Oystercard::MAX_LIMIT}"
		end
	end

  it 'Should initialize with a balance of 0' do
		expect (subject.balance) == 0
	end

	it 'should start with journey as false' do
		expect(subject.in_journey?).to eq false
	end

  it 'should raise error if minimum fair exceeds balance' do
    expect{ subject.touch_in(entry_station) }.to raise_error "Balance must be greater than 1" 
  end

	it 'in journey should be true when card is touched in' do
		subject.top_up(5)
    subject.touch_in(entry_station)
		expect(subject.in_journey?).to eq true
	end

	it 'in journey should be true when card is touched in' do
		oyster = Oystercard.new
    oyster.top_up(5)
		oyster.touch_in(entry_station)
		oyster.touch_out(exit_station)
		expect(oyster.in_journey?).to eq false
	end

  it 'should deduct min fare when touching out' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
  end

  describe '#stations' do

	  it 'should remember the entry station' do
		subject.top_up(10)
    	subject.touch_in(entry_station)
		expect(subject.entry_station).to eq entry_station
	  end

	  it 'should remember the exit station' do
		  subject.top_up(10)
		  subject.touch_in(entry_station)
		  subject.touch_out(exit_station)
		  expect(subject.exit_station).to eq exit_station
	  end

	  it 'should record both entry and exit station in journeys' do
		  subject.top_up(10)
		  subject.touch_in(entry_station)
		  subject.touch_out(exit_station)
		  expect(subject.journeys).to include([entry_station, exit_station])
	  end
    end
end