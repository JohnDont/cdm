FactoryGirl.define do
  factory :user do
    sequence(:email) { Faker::Internet.email }
    password 'secure'
    sequence(:full_name) { Faker::Name.name }
  end

end
