FactoryGirl.define do
  factory :product do
    name              { Faker::Name.name }
    price             { Faker::Commerce.price }
    image             { Faker::Avatar.image }
    association :category, factory: :category
  end
end
