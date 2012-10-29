class ReservationSystem
  attr_accessor :itineraries

  def initialize
    @itineraries = []
  end

  def find_schedules(params)
    i = @itineraries.select { |itinerary|
      itinerary.from == params[:from] &&
      itinerary.to == params[:to] &&
      itinerary.date == params[:date]
    }
  end

  def add_itinerary(itinerary)
    @itineraries << itinerary
  end
end
