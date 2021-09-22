class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_responsible_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_from_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300, only_integer: true }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_responsible
  belongs_to :shipping_from
  belongs_to :shipping_date
end
