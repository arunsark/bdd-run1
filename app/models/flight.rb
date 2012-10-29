class Flight
  attr_accessor :flight_no, :capacity
  def initialize(flight_no)
    @flight_no = flight_no
    @capacity = 100
  end
end
