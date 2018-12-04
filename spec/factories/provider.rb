FactoryBot.define do
  factory :provider do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    amount { Faker::Number.number(4) }
  end
end
