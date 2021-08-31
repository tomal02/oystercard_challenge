# NameError, /spec/oystercard_spec.rb, 1
require 'oystercard'
describe Oystercard do
  it 'Should initialize with a balance of 0' do
		expect (subject.balance) == 0
	end

	it 'should start with journey as false' do
		expect(subject.in_journey?).to eq false
	end

	it 'in journey should be true when card is touched in' do
		subject.touch_in
		expect(subject.in_journey?).to eq true
	end

	it 'in journey should be true when card is touched in' do
		oyster = Oystercard.new
		oyster.touch_in
		oyster.touch_out
		expect(oyster.in_journey?).to eq false
	end

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

	describe '#deduct' do
		it 'Should deduct from balance' do
			subject.top_up(10)
			subject.deduct(5)
			expect(subject.balance) == 5
		end
	end
end