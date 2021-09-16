class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :area
  belongs_to :atmosphere
  has_many :shop_genres, dependent: :destroy
  has_many :revies, dependent: :destroy
  belongs_to :customer, optional: true
  has_many :customer, through: :favorites

  attachment :image

end
