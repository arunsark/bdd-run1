class Itinerary
  attr_accessor :flight, :from, :to, :date, :booked_seats

  def initialize(flight, from, to, date)
    @flight = flight
    @from = from
    @to = to
    @date = date
    @booked_seats = 0
  end

  def book_ticket(seats)
    if @booked_seats == @flight.capacity
      OpenStruct.new(status: "not_available")
    else
      @booked_seats += 1
      OpenStruct.new(status: "confirmed")
    end
  end

  def flight_number
    @flight.flight_no
  end
end
