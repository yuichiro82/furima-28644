class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :city, :house_number, :building_name, :phone_nubmer

  with_options presence: true do
    # 「address」に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :phone_nubmer, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}

  def save
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birthday: birthday)
    item = Item.create(name: name, text: text, category_id: category_id, item_status: item_status, burden_amount_id: burden_amount_id, shipment_source_id: shipment_source_id, delivery_schedule_id: delivery_schedule_id, price: price, user_id: user_id)
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_nubmer: phone_nubmer, order_id: order.id)
  end
end