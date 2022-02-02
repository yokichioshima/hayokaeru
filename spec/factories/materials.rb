FactoryBot.define do
  factory :material do
    name           {Faker::Food.fruits}
    category_id    {Faker::Number.between(from: 2, to: 8)}
    price          {Faker::Number.between(from: 0, to: 9999)}
    options        {Faker::Lorem.sentence}

    after(:build) do |material|
      material.image.attach(io: File.open('public/images/kareyrice.jpeg'), filename: 'kareyrice.jpeg')
    end
  end
end
