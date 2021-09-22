FactoryBot.define do
  factory :item do
    item_name                     {'アイテム'}
    explanation                   {'商品の説明です'}
    category_id                   {'2'}
    condition_id                  {'2'}
    shipping_cost_responsible_id  {'2'}
    shipping_from_id              {'2'}
    shipping_date_id              {'2'}
    price                         {2000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
