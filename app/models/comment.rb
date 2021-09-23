class Comment < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :customer, optional: true

  attachment :image
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
