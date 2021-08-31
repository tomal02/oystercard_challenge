# NameError, /spec/oystercard_spec.rb, 1
require 'oystercard'
describe Oystercard do
  it 'Should initialize with a balance of 0' do
		expect (subject.balance) == 0
	end
end