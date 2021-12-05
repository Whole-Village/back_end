FactoryBot.define do
  factory :child do
    user { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    birthdate { "MyString" }
  end
end
