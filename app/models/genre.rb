class Genre < ApplicationRecord
  belongs_to :shop
  has_many :products, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :atmospheres, dependent: :destroy
end
