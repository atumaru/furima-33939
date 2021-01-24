class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname,presence: true
  validates :password,presence: true, length: {minimum: 6}
  validates :last_name,presence: true
  validates :first_name,presence: true
  validates :first_name_kana,presence: true
  validates :last_name_kana,presence: true
  validates :birth_date,presence: true
  validates :email,uniqueness: true
  VALID_PASSWORD_REGEX = VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }


end