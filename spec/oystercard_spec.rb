# NameError, /spec/oystercard_spec.rb, 1
require 'oystercard'
describe Oystercard do
  it 'Should initialize with a balance of 0' do
		expect (subject.balance) == 0
	end

	it 'Should top up balance' do
		subject.top_up(10)
		expect(subject.balance) == 10
	end

	describe '#top_up' do
		it {is_expected.to respond_to(:top_up).with(1).argument }
	end
end