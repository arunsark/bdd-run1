require_relative '../../app/models/flight'

describe Flight do
  before do
    @it = Flight.new("6E-154")
  end

  it "should have an itinerary" do
    itinerary = Itinerary.new("Hyderabad", "Bangalore", "20/12/2012")
    @it.add_itinerary(itinerary)
    @it.itineraries.should include(itinerary)
  end
end
