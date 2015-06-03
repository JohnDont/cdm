FactoryGirl.define do
  factory :song do
    sequence(:remote_image_url) { Faker::Avatar.image }
    sequence(:title) { Faker::Lorem.sentence(rand(2..5)) }
    sequence(:description) { Faker::Lorem.sentences(3).join(' ') }
    sequence(:user) { FactoryGirl.create(:user) }
    sequence(:plays) { rand(1..200) }
  end

end
