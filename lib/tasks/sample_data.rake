namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 newbie: false)
    admin.toggle!(:admin)
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   newbie: true)
    end
    
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+21}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   newbie: false)
    end
    
    users = User.all
    note = Faker::Lorem.sentence(5)
    number_of_people = 1+rand(3)
    arrival_date = Random.date
    arrival_time = "23:58"
    flight_number = "AA1234"
    users.each { |user| user.posts.create!(note: note, number_of_people: number_of_people, arrival_date: arrival_date, arrival_time: arrival_time, flight_number: flight_number)}
  end
end