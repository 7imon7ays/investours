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
  { location: "England", date: "2014-10-01" },
  { location: "Mexico", date: "2014-05-01" }
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

projects = Project.create([
  { entrepreneur_id: 1, title: "Buy me a car", description: "I want a new car!", fundraising_goal: 200 }
])