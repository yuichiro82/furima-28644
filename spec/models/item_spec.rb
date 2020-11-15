require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての値が入力されていれば保存できる事' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存ができないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存ができないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では保存ができないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'category_idが0では保存ができないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it 'item_status_idが0では保存ができないこと' do
      @item.item_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Item status must be other than 0')
    end

    it 'burden_amount_idが0では保存ができないこと' do
      @item.burden_amount_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden amount must be other than 0')
    end

    it 'shipment_source_idが0では保存ができないこと' do
      @item.shipment_source_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment source must be other than 0')
    end

    it 'delivery_schedule_idが0では保存ができないこと' do
      @item.delivery_schedule_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery schedule must be other than 0')
    end

    it 'priceが空では保存ができないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字のみしか保存ができないこと' do
      @item.price = '２２２'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid', 'Price is not a number')
    end

    it 'priceは半角数字のみしか保存ができないこと(半角）' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid', 'Price is not a number')
    end

    it 'priceが300以下では保存ができないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999以上では保存ができないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
