class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_responsible_id, presence: true
  validates :shipping_from_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
