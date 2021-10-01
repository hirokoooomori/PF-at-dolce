class Shop < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :area
  belongs_to :atmosphere
  belongs_to :customer, optional: true
  has_many :customer, through: :favorites
  has_one :faq

  attachment :image

def favorited_by?(customer)
  favorites.where(customer_id: customer.id).exists?
end

def candidated_by?(customer)
  candidates.where(customer_id: customer.id).exists?
end

end
