class Admin < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :faqs, dependent: :destroy
end
