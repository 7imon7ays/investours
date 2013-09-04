# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


entrepreneurs = Entrepreneur.create([
  { first_name: "Bob", last_name: "Baumeister", location: "Germany"},
  { first_name: "Mary", last_name: "Lamb", location: "England"},
  { first_name: "Joe", last_name: "Plumb", location: "England"},
  { first_name: "Roberta", last_name: "Vasquez", location: "Mexico"},
])

tours = Tour.create([
  { location: "England", start_date: "09-01-2014", end_date: "09-30-2014" },
  { location: "Mexico", start_date: "10-01-2014", end_date: "10-31-2014" }
])

tour_meetings = TourMeeting.create([
  { entrepreneur_id: 2, tour_id: 1 },
  { entrepreneur_id: 3, tour_id: 1 },
  { entrepreneur_id: 4, tour_id: 2 }
])

loans = Loan.create([
  { investor_id: 1, entrepreneur_id: 1 },
  { investor_id: 1, entrepreneur_id: 2 }
])