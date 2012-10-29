
Given /^there is a flight "(.*?)" between "(.*?)" and "(.*?)" on "(.*?)"$/ do |flight_no, from, to, on|
  @flight = Flight.new(flight_no)
  @itinerary = Itinerary.new(@flight, from, to, on)
  @reservation_system = ReservationSystem.new
  @reservation_system.add_itinerary(@itinerary)
end

Given /^I search for flights between "(.*?)" and "(.*?)" on "(.*?)"$/ do |place1, place2, date|
  @schedules = @reservation_system.find_schedules(from: place1, to: place2, date: date)
end

Then /^the search result should include the flight "(.*?)"$/ do |flight_number|
  @schedules.select { |schedule| schedule.flight_number == flight_number }.length.should > 0
end

Given /^I select the flight "(.*?)" from the search result$/ do |flight_number|
  @selected_itinerary = @schedules.select { |schedule| schedule.flight_number == flight_number }[0]
end

When /^I book the tickets$/ do
  @my_ticket = @selected_itinerary.book_ticket(1)
end

Then /^I should have my tickets confirmed$/ do
  @my_ticket.status.should eq("confirmed")
end
