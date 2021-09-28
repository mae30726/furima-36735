class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture
    validates :city
    validates :block
    validates :phone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(postcode: postcode, prefecture: prefecture, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end