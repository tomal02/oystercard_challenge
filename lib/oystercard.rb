class Oystercard
	attr_reader :balance
	MAX_LIMIT = 90
	def initialize
		@balance = 0
		@in_use = false
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

	def touch_in
		@in_use = true
	end

	def touch_out
		@in_use = false
	end

	def in_journey?
		if @in_use
			true
		else
			false
		end
	end
end