FactoryBot.define do
  factory :item do
    name              {"風の谷"}
    price             {"3000"}
    explanation       {"宮崎駿の作品"}
    category_id       {"1"}
    condition_id      {"1"}
    delivery_from_id  {"1"}
    delivery_fee_id   {"1"}
    delivery_date_id  {"1"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
