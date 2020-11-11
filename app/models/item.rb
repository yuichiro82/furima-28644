class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :name
    validates  :text 
  end
  
  with_options numericality: { other_than: 1 } do
   validates :category_id
  #validates :item_status_id
  #validates :burder_amount_id
  #validates :shipment_source_id
  #validates :delivery_schedule_id
  end 
end
