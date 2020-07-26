# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    price { Faker::Number.digit }
  end

  factory :product_params, class: Hash do
    initialize_with do
      {
        name: Faker::Lorem.sentence,
        description: Faker::Lorem.sentence,
        price: Faker::Number.digit
      }
    end
  end

  factory :product_invalid_params, class: Hash do
    initialize_with do
      {
        name: "",
        description: "",
        price: Faker::Lorem.sentence
      }
    end
  end
end
