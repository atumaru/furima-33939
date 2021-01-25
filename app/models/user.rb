class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do      
  validates :nickname
  validates :password, length: {minimum: 6}
  validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :birth_date
  end
  validates :email,uniqueness: true
  VALID_PASSWORD_REGEX = VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }


end