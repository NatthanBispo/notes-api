FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence(word_count: rand(2..40)) }
  end
end
