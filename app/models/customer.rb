class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :revies, dependent: :destroy
  has_many :shops, dependent: :destroy

end