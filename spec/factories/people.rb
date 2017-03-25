FactoryGirl.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.between(80.years.ago, 18.year.ago) }
    email { Faker::Internet.email }
  end
end
