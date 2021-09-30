FactoryBot.define do
  factory :purchase_destination do
    postcode      {'123-4567'}
    prefecture_id {'1'}
    city          {'テスト市'}
    block         {'テスト1-1-1'}
    building      {'テスト101'}
    phone_number  {'09012345678'}
    price         {3000}
    token         {"tok_8995d2ee8cc1815a7a5584b304ab"}
  end
end
