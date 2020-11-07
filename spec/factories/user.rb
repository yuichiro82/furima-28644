FactoryBot.define do
  factory :user do
    nickname              { "taro" }
    email                 {Faker::Internet.free_email}
    encrypted_password    { "qwe123" }
    family_name           { "山田" }
    first_name            { "太郎" }
    family_name_kana      { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birthday              {Faker::Date.birthday(min_age: 0, max_age: 90)}
  end
end
