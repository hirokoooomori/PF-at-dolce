class Product < ApplicationRecord
  belongs_to :genre
  has_many :shops, dependent: :destroy
end
