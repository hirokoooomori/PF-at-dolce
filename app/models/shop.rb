class Shop < ApplicationRecord

#validates :status, presence: true
validate :sales_format_validation

  has_many :candidates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :area
  belongs_to :atmosphere
  belongs_to :customer, optional: true
  has_many :customer, through: :favorites
  has_one :faq

  attachment :image

  def sales_format_validation
    #eat_in とtake_out が両方falseだった時エラー
    pp eat_in
    pp take_out
    if (eat_in || take_out) == false
      errors.add(:eat_in, "イートインかテイクアウトを選択してください")
    end
  end

def favorited_by?(customer)
  favorites.where(customer_id: customer.id).exists?
end

def candidated_by?(customer)
  candidates.where(customer_id: customer.id).exists?
end

end
