FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email}
    password_digest { Faker::Internet.password }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    covid_vaccinated { Faker::Boolean.boolean }
    volunteer_credits { Faker::Number.digit }
  end
end
