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

projects = Project.create([
  { entrepreneur_id: 1, title: "New Car", description: "I need a car for my business!", fundraising_goal: 200 },
  { entrepreneur_id: 2, title: "Restaurant", description: "I want to start a restaurant.", fundraising_goal: 1000 }
])

loans = Loan.create([
  { lender_id: 1, entrepreneur_id: 1, project_id: 1, principal: 100, interest: 0.05 },
  { lender_id: 1, entrepreneur_id: 2, project_id: 2, principal: 300, interest: 0.10 },
  { lender_id: 1, entrepreneur_id: 2, project_id: 2, principal: 300, interest: 0.05 }
])

payments = Payment.create([
  { loan_id: 2, payer_id: 2, amount: 500 },
  { loan_id: 2, payer_id: 2, amount: 250 }
])