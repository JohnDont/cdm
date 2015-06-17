videos = ['8ser86DeIzg', 'IKs5OsT4dIY', 'tFqz4_sSaAk', 'OZkAePyJO6U', '8lI-0UmEMBc',
  'ExVtrghW5Y4', 'VkTJC4A_TtM', 'CdQN5xTuFUM', '-504g71bBE0', 'B5YNiCfWC3A']

FactoryGirl.define do
  factory :song do
    # sequence(:remote_image_url) { Faker::Avatar.image }
    sequence(:title) { Faker::Lorem.sentence(rand(2..5)) }
    sequence(:description) { Faker::Lorem.sentences(3).join(' ') }
    sequence(:user) { FactoryGirl.create(:user) }
    sequence(:category) { FactoryGirl.create(:category) }
    sequence(:url) { "https://www.youtube.com/watch?v=#{videos.sample}" }
  end

end
