FactoryBot.define do
  factory :child do
    user_id { 1 }
    first_name { Faker::TvShows::Simpsons.character }
    last_name { Faker::TvShows::Simpsons.character }
    birthdate { Faker::Date.between(from: '2014-09-23', to: '2022-09-25') }
  end
end
