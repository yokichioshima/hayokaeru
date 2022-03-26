FactoryBot.define do
  factory :product do
    name      { Faker::Food.dish }
    sort_id   { Faker::Number.between(from: 2, to: 6) }
    options   { Faker::Lorem.characters(number: 20) }
    after(:build) do |material|
      material.image.attach(io: File.open('public/images/kareyrice.jpeg'), filename: 'kareyrice.jpeg')
    end
  end
end
