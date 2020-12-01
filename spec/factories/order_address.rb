FactoryBot.define do
  factory :order_address do
    postal_code     { '111-1111' }
    prefecture_id   { 1 }
    city            { '横浜市緑区' }
    house_number    { '青山1-1-1' }
    building_name   { '柳ビル103' }
    phone_number    { 1234567890 }
    user_id         { 1 }
    token           {"tok_abcdefghijk00000000000000000"} 
  end
end
