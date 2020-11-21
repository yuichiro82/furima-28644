class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :burden_amount
  belongs_to :shipment_source
  belongs_to :delivery_schedule

  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :burden_amount_id
    validates :shipment_source_id
    validates :delivery_schedule_id
  end
end
