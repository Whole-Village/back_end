FactoryBot.define do
  factory :event do
    name { Faker::Creature::Animal.name }
    date { Faker::Date.between(from: '2014-09-23', to: '2022-09-25') }
    description { Faker::TvShows::Seinfeld.quote }
    time { "04:30" }
    adult_required { Faker::Boolean }
    images { "Not present" }
    village_id { 1 }
  end
end
