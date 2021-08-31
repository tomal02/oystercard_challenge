class Oystercard
	attr_reader :balance
	MAX_LIMIT = 90
	def initialize
		@balance = 0
	end

  def top_up(amount)
		fail "#{amount} exceeds #{MAX_LIMIT}" if max?(amount)
    @balance += amount
  end

	def max?(amount)
		if (@balance + amount) > MAX_LIMIT
			true
		end
	end

  def deduct(fare)
    @balance -= fare
  end
end