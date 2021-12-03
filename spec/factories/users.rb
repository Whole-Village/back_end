FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    phone_number { "MyString" }
    address { "MyString" }
    covid_vaccinated { false }
    volunteer_credits { "MyString" }
  end
end
