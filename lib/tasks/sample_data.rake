namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    make_trips
  end
end
  
  def make_users
    admin = User.create!(name: "Admin User",
                 email: "admin@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 newbie: false,
                 provide_housing: false,
                 gender: true,
                 major: EE)
    admin.toggle!(:admin)
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   newbie: true,
                   gender: true,
                   major: MSA
                   )
    end
    
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+21}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   newbie: false,
                   gender: false,
                   provide_housing: true,
                   housing_number: 1,
                   major: EE)
    end
  end
  
  
  def make_posts  
    newbies = User.find_all_by_newbie(true)
    note = Faker::Lorem.sentence(5)
    number_of_people = 1+rand(3)
    arrival_date = Random.date
    arrival_time = "23:58"
    flight_number = "AA1234"
    newbies.each { |newbie| newbie.posts.create!(note: note, number_of_people: number_of_people, arrival_date: arrival_date, 
                                                 arrival_time: arrival_time, flight_number: flight_number, need_pickup: true, 
                                                 need_housing:true)}
  end
  
  
  def make_trips
    volunteers = User.find_all_by_newbie(false)
    posts = Post.all
    n=0
    volunteers.each do |volunteer| 
      volunteer.pick!(posts[n])
     
      posts[n].toggle!(:status)
       n=n+1
    end
  end
  
