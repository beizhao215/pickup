FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    newbie true
    
    factory :admin do
      admin true
    end
  end
  
  factory :post do
    note "Lorem ipsum"
    number_of_people "1"
    arrival_date "6/1/2012" 
    arrival_time "21:08"
    flight_number "AA2021"
    luggage_number "two 158"
    destination "utd"
    user
  end
end