require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  it '全ての値が入力されていれば保存できる事' do
    expect(@order_address).to be_valid
  end

  it 'building_nameがなくても保存できる事' do
    @order_address.building_name = ''
    expect(@order_address).to be_valid
  end

  it '郵便番号が空では保存できない' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it '郵便番号はハイフンなしで保存できない' do
    @order_address.postal_code = '0000000'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Postal code is invalid')
  end

  it 'prefecture_idが0では保存できない' do
    @order_address.prefecture_id = 0
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
  end

  it 'cityが空では保存できない' do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end

  it 'house_numberが空では保存できない' do
    @order_address.house_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("House number can't be blank")
  end

  it 'phone_numberが空では保存できない' do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
  end

  it 'phone_numberが10文字以下では保存できない' do
    @order_address.phone_number = 123_456_789
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone number is invalid')
  end

  it 'user_idが空では保存できない' do
    @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
  end

  it 'tokenが空では保存できない' do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
end
