class Oystercard
	attr_reader :balance, :entry_station
	MAX_LIMIT = 90
  MIN_FARE = 1

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

	def touch_in(entry_station)
    fail "Balance must be greater than 1" if @balance < 1
		@entry_station = entry_station
	end

	def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
	end

	def in_journey?
    !!@entry_station
	end

  private
  def deduct(fare)
    @balance -= fare
  end
end