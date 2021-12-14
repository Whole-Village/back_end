FactoryBot.define do
  factory :village do
    name { Faker::Lorem.sentence }
    description { Faker::TvShows::Simpsons.quote }
  end
end
