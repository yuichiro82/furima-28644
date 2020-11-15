FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    text {Faker::Lorem.sentence}
    category_id {1}
    item_status_id {1}
    burden_amount_id {1}
    shipment_source_id {1}
    delivery_schedule_id {1}
    price {3300}
    association :user
  end
end
