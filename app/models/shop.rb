class Shop < ApplicationRecord
  belongs_to :product
  has_many :scores, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :atmospheres, dependent: :destroy
  has_one :area
  has_many :shop_genres, dependent: :destroy
end
