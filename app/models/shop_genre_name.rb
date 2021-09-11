class ShopGenreName < ApplicationRecord

  has_many :shop_genres, dependent: :destroy

end
