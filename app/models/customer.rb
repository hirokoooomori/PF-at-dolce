class Customer < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :scores, dependent: :destroy
end
