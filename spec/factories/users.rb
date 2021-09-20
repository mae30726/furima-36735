FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test12'}
    password_confirmation {password}
    user_last_name        {'名字'}
    user_first_name       {'名前'}
    user_last_name_kana  {'ミョウジ'}
    user_first_name_kana  {'ナマエ'}
    birthday              {'2000-01-01'}
  end
end