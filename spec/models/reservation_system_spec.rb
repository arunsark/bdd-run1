require_relative '../../app/models/itinerary'
require_relative '../../app/models/flight'
require_relative '../../app/models/reservation_system'

describe ReservationSystem do

  describe "find schedule" do
    before do
      @it = ReservationSystem.new
      flight = Flight.new("6E-154")
      @itinerary = Itinerary.new(flight, "Hyderabad", "Bangalore", "20/12/2012")
      @it.add_itinerary(@itinerary)
    end

    context "when one flight matching the route" do
      it "selects the flight matching the schedule" do
        @it.find_schedules(from: "Hyderabad", to: "Bangalore", date: "20/12/2012").should include(@itinerary)
      end
    end

    context "more than one flight matching the route" do
      before do
        flight = Flight.new("SG-154")
        @itinerary_1 = Itinerary.new(flight, "Hyderabad", "Bangalore", "20/12/2012")
        @it.add_itinerary(@itinerary_1)
        flight = Flight.new("9W-154")
        @itinerary_2 = Itinerary.new(flight, "Hyderabad", "Trivandrum", "20/12/2012")
        @it.add_itinerary(@itinerary_2)
      end
      it "selects all flight itineraries matching the schedule" do
        @it.find_schedules(from: "Hyderabad", to: "Bangalore", date: "20/12/2012").length.should == 2
      end
    end
  end
end
