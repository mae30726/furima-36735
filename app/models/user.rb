class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  validates :email
  validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :user_last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :user_first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :user_last_name_kana, presence: true, format: { with: /\p{katakana}//\A[ァ-ヶー－]+\z/ }
  validates :user_first_name_kana, presence: true, format: { with: /\p{katakana}//\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

end