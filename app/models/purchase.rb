class Purchase < ApplicationRecord
  has_one :destination
  belongs_to :item
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
