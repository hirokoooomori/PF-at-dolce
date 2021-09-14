class Product < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :shop, optional: true
  
  attachment :image
end
