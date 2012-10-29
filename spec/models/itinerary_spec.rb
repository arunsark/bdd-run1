require_relative '../../app/models/flight'
require_relative '../../app/models/itinerary'
require 'ostruct'

describe Itinerary do
  describe "Book Ticket" do
    before do
      @flight = Flight.new("9W-2790")
      @itinerary = Itinerary.new(@flight, "hyd", "mum", "20/01/2012")
    end

    context "when seats available" do
      it "ticket should be confirmed" do
        @itinerary.book_ticket(1).status.should eq("confirmed")
      end
      it "increments the booked seats count for the itinerary" do
        lambda do
          @itinerary.book_ticket(1).status.should eq("confirmed")
        end.should change(@itinerary, :booked_seats).by(1)
      end
    end

    context "when seats are not available" do
      before do
        @itinerary.booked_seats = 100
      end
      it "ticket should not be confirmed" do
        @itinerary.book_ticket(1).status.should eq("not_available")
      end
    end
  end
end
