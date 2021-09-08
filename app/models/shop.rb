class Shop < ApplicationRecord
  belongs_to :product
  has_many :scores, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
