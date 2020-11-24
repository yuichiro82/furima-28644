class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  belongs_to :prefecture
end
